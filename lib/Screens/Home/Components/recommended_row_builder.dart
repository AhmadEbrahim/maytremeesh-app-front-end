import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:maytremeesh/Provider/location.dart';
import 'package:maytremeesh/Provider/token.dart';
import 'package:maytremeesh/models/item.dart';
import 'package:provider/provider.dart';
import '../Components/itemContainer.dart';

Future<List<Item>> fetchItems(BuildContext context) async {
  http.Response response = await http.get(
      Uri.parse(
          'http://maytrmeesh.herokuapp.com/api/customers/recommended/?location=${Provider.of<Location>(context).location}'),
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

class RecommendedRow extends StatelessWidget {
  const RecommendedRow({
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
        builder: (context, AsyncSnapshot<List<Item>> snapshot) => snapshot
                .hasData
            ? snapshot.data!.isNotEmpty
                ? ListView.builder(
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('/item-checkout-screen', arguments: {
                            'imgpath': snapshot.data![index].imgPath,
                            'name': snapshot.data![index].name,
                            'price': snapshot.data![index].price,
                            'description': snapshot.data![index].description,
                            'discount': snapshot.data![index].discount,
                            'quantity': snapshot.data![index].quantity,
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
                          availabilityTime:
                              snapshot.data![index].availabilityTime,
                          id: snapshot.data![index].id,
                        ),
                      );
                    })
                : Center(
                    child: Text(
                      'Favorite some items to help us find you what suits you best!',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
