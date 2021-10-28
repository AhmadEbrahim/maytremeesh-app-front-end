import 'package:flutter/material.dart';
import 'package:maytremeesh/Components/fav_button.dart';
import 'package:maytremeesh/Components/header.dart';
import 'package:maytremeesh/Data/dummy_data.dart';
import 'package:maytremeesh/constants.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'History',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Header(header: 'Your History', size: 28),
          Divider(
            thickness: 1,
          ),
          SizedBox(
            height: size.height * 0.7,
            child: ListView.builder(
                itemCount: dummyItems.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: size.width * 0.95,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12)),
                                child: Image.network(
                                  dummyItems[index].imgPath,
                                  width: 0.95 * size.width,
                                  height: 0.3 * size.height,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          FavoriteButton(
                                              id: dummyItems[index].id),
                                        ],
                                      ),
                                      SizedBox(
                                        height: size.height * 0.18,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: size.width * 0.73,
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(29),
                                            child: Container(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              width: size.width * 0.2,
                                              height: size.height * 0.033,
                                              child: Center(
                                                child: FittedBox(
                                                  fit: BoxFit.cover,
                                                  child: Text(
                                                    'EGP ${dummyItems[index].price}',
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Colors.white,
                                                      fontFamily: 'Caturra',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
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
                          width: size.width * 0.95,
                          decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.35)),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                dummyItems[index].name,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Proxima'),
                              ),
                              Text('${dummyItems[index].price} EGP'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      )
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
