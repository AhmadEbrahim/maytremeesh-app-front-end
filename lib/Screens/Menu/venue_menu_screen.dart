import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maytremeesh/Components/fav_button.dart';
import 'package:maytremeesh/Components/header.dart';
import 'package:maytremeesh/Provider/token.dart';
import 'package:maytremeesh/Screens/Menu/components/multi_select_chip.dart';
import 'package:maytremeesh/constants.dart';
import 'package:maytremeesh/models/item.dart';
import 'package:http/http.dart' as http;
import 'package:maytremeesh/models/package.dart';
import 'package:provider/provider.dart';

Future<List<Item>> fetchItems(BuildContext context, int id) async {
  http.Response response = await http.get(
      Uri.parse(
          'http://maytrmeesh.herokuapp.com/api/available-items/$id/venue-items/'),
      headers: <String, String>{
        'Authorization':
            'Token ${Provider.of<Token>(context, listen: false).token}'
      });
  var data = jsonDecode(response.body);
  List<Item> result = [];
  for (var item in data) {
    result.add(Item.fromJson(item));
  }
  return result;
}

Future<List<Package>> fetchPackages(BuildContext context, int id) async {
  http.Response response = await http.get(
      Uri.parse(
          'http://maytrmeesh.herokuapp.com/api/available-packages/$id/venue-packages/'),
      headers: <String, String>{
        'Authorization':
            'Token ${Provider.of<Token>(context, listen: false).token}',
      });
  List<dynamic> data = jsonDecode(response.body);
  List<Package> result = [];
  for (var package in data) {
    result.add(Package.fromJson(package));
  }
  return result;
}

class VenueMenuScreen extends StatelessWidget {
  const VenueMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    final String name = routeArgs['name'] as String;
    final String logoPath = routeArgs['logo'] as String;
    final int id = routeArgs['id'] as int;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SvgPicture.network(
                logoPath,
                height: size.height * 0.15,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Rate this venue!',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            MultiSelect(),
            SizedBox(
              height: size.height * 0.02,
            ),
            Header(header: 'Available Items', size: 24),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height: size.height * 0.3,
              child: FutureBuilder(
                future: fetchItems(context, id),
                builder: (context, AsyncSnapshot<List<Item>> snapshot) =>
                    snapshot.hasData
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: size.width * 0.7,
                                        child: Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(12),
                                                  topRight:
                                                      Radius.circular(12)),
                                              child: Image.network(
                                                snapshot.data![index].imgPath,
                                                width: 0.7 * size.width,
                                                height: 0.2 * size.height,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Positioned.fill(
                                              child: Align(
                                                alignment: Alignment.topRight,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        FavoriteButton(
                                                          id: snapshot
                                                              .data![index].id,
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        29),
                                                            child: Container(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.5),
                                                              width:
                                                                  size.width *
                                                                      0.2,
                                                              height:
                                                                  size.height *
                                                                      0.033,
                                                              child: Center(
                                                                child:
                                                                    FittedBox(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  child: Text(
                                                                    'EGP ${snapshot.data![index].price}',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          24,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      color: Colors
                                                                          .white,
                                                                      fontFamily:
                                                                          'Caturra',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        )),
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12)),
                                      child: Container(
                                        height: size.height * 0.045,
                                        width: size.width * 0.7,
                                        decoration: BoxDecoration(
                                            color:
                                                primaryColor.withOpacity(0.35)),
                                        child: Center(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              snapshot.data![index].name,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w800,
                                                  fontFamily: 'Proxima'),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    )
                                  ],
                                ),
                              );
                            })
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
              ),
            ),
            Header(header: 'Available Packages', size: 24),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height: size.height * 0.3,
              child: FutureBuilder(
                  future: fetchPackages(context, id),
                  builder: (context, AsyncSnapshot<List<Package>> snapshot) =>
                      snapshot.hasData
                          ? snapshot.data!.isNotEmpty
                              ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                              width: size.width * 0.7,
                                              child: Stack(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(12),
                                                            topRight:
                                                                Radius.circular(
                                                                    12)),
                                                    child: Image.network(
                                                      snapshot
                                                          .data![index].imgPath,
                                                      width: 0.7 * size.width,
                                                      height: 0.2 * size.height,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  Positioned.fill(
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              FavoriteButton(
                                                                id: snapshot
                                                                    .data![
                                                                        index]
                                                                    .id,
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              29),
                                                                  child:
                                                                      Container(
                                                                    color: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.5),
                                                                    width:
                                                                        size.width *
                                                                            0.2,
                                                                    height: size
                                                                            .height *
                                                                        0.033,
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          FittedBox(
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        child:
                                                                            Text(
                                                                          'EGP ${snapshot.data![index].price}',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                24,
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                            color:
                                                                                Colors.white,
                                                                            fontFamily:
                                                                                'Caturra',
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )),
                                          ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(12)),
                                            child: Container(
                                              height: size.height * 0.045,
                                              width: size.width * 0.7,
                                              decoration: BoxDecoration(
                                                  color: primaryColor
                                                      .withOpacity(0.35)),
                                              child: Center(
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    snapshot.data![index].name,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontFamily: 'Proxima'),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          )
                                        ],
                                      ),
                                    );
                                  })
                              : Center(
                                  child: Text(
                                  'No available packages',
                                  style: TextStyle(fontSize: 18),
                                ))
                          : Center(
                              child: CircularProgressIndicator(),
                            )),
            ),
          ],
        ),
      ),
    );
  }
}
