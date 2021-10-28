import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maytremeesh/Provider/location.dart';
import 'package:maytremeesh/Provider/token.dart';
import 'package:maytremeesh/models/venue.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

Future<List<Venue>> fetchItems(BuildContext context) async {
  http.Response response = await http.get(
      Uri.parse(
          'http://maytrmeesh.herokuapp.com/api/venues/?location=${Provider.of<Location>(context).location}'),
      headers: <String, String>{
        'Authorization':
            'Token ${Provider.of<Token>(context, listen: false).token}'
      });
  var data = jsonDecode(response.body);
  List<Venue> result = [];
  for (var item in data) {
    result.add(Venue.fromJson(item));
  }
  return result;
}

class VenueBuilder extends StatelessWidget {
  final List<Venue>? venues;
  final Size size;
  const VenueBuilder({
    required this.size,
    this.venues,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.25,
      child: FutureBuilder(
          future: fetchItems(context),
          builder: (context, AsyncSnapshot<List<Venue>> snapshot) =>
              snapshot.hasData
                  ? snapshot.data!.isNotEmpty
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed('/venue-menu', arguments: {
                                  'id': snapshot.data![index].id,
                                  'name': snapshot.data![index].name,
                                  'logo': snapshot.data![index].logoPath,
                                });
                              },
                              child: Container(
                                  width: size.width * 0.64,
                                  height: size.height * 0.3,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                          child: Align(
                                        alignment: Alignment.center,
                                        child: SvgPicture.network(
                                          snapshot.data![index].logoPath,
                                          width: size.width * 0.1,
                                          height: size.height * 0.1,
                                        ),
                                      )),
                                      Positioned.fill(
                                          child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          snapshot.data![index].name,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ))
                                    ],
                                  )),
                            );
                          })
                      : Center(
                          child: Text(
                            'Venues have no available items at the moment',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                  : Center(
                      child: CircularProgressIndicator(),
                    )),
    );
  }
}
