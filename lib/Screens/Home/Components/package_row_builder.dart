import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:maytremeesh/Provider/location.dart';
import 'package:maytremeesh/Provider/token.dart';
import 'package:maytremeesh/models/package.dart';
import 'package:provider/provider.dart';
import '../Components/itemContainer.dart';
import 'package:http/http.dart' as http;

Future<List<Package>> fetchItems(BuildContext context) async {
  http.Response response = await http.get(
      Uri.parse(
          'http://maytrmeesh.herokuapp.com/api/available-packages/?location=${Provider.of<Location>(context).location}'),
      headers: <String, String>{
        'Authorization':
            'Token ${Provider.of<Token>(context, listen: false).token}',
      });
  var data = jsonDecode(response.body);
  List<Package> result = [];
  for (var package in data) {
    result.add(Package.fromJson(package));
  }
  return result;
}

class PackageRow extends StatelessWidget {
  const PackageRow({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    fetchItems(context);
    return SizedBox(
      height: size.height * 0.25,
      child: FutureBuilder(
        future: fetchItems(context),
        builder: (context, AsyncSnapshot<List<Package>> snapshot) => snapshot
                .hasData
            ? ListView.builder(
                itemCount: snapshot.data!.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/package-checkout-screen', arguments: {
                        'imgpath': snapshot.data![index].imgPath,
                        'name': snapshot.data![index].name,
                        'price': snapshot.data![index].price,
                        'quantity': snapshot.data![index].quantity,
                        'venueName': snapshot.data![index].venueName,
                        'description': snapshot.data![index].description,
                        'items': snapshot.data![index].items,
                        'discount': snapshot.data![index].discount,
                        'id': snapshot.data![index].id,
                        'venueID': snapshot.data![index].venueID,
                      });
                    },
                    child: ItemContainer(
                      size: size,
                      imgPath: snapshot.data![index].imgPath,
                      price: snapshot.data![index].price,
                      venueLogoPath: snapshot.data![index].venueLogoPath,
                      itemName: snapshot.data![index].name,
                      venueName: snapshot.data![index].venueName,
                      availabilityTime: snapshot.data![index].availabilityTime,
                      id: snapshot.data![index].id,
                    ),
                  );
                })
            : Center(
                child: Text(
                  'No available packages',
                  style: TextStyle(fontSize: 18),
                ),
              ),
      ),
    );
  }
}
