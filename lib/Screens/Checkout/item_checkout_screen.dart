import 'package:flutter/material.dart';
import 'package:maytremeesh/Components/counterPage.dart';
import 'package:maytremeesh/Provider/counter.dart';
import 'package:maytremeesh/Provider/token.dart';
import 'package:maytremeesh/Screens/Checkout/Components/location_info.dart';
import 'package:maytremeesh/Screens/Checkout/Components/pop_up.dart';
import 'package:maytremeesh/Screens/Checkout/Components/switch.dart';
import 'package:provider/provider.dart';
import '/Components/rounded_button.dart';
import 'Components/price_detail_fixed.dart';
import '../../Components/header.dart';
import 'package:http/http.dart' as http;

Future<void> placeOrder(BuildContext context, double total, int quantity,
    bool isDonated, int foodVenueID, int itemID) async {
  http.Response response = await http.post(
      Uri.parse('http://maytrmeesh.herokuapp.com/api/orders/'),
      headers: <String, String>{
        'Authorization':
            'Token ${Provider.of<Token>(context, listen: false).token}'
      },
      body: <String, dynamic>{
        'total': total.toString(),
        'quantity': quantity.toString(),
        'order_type': 'item',
        'is_donated': isDonated.toString(),
        'food_venue': foodVenueID.toString(),
        'item': itemID.toString(),
      });
}

class ItemCheckoutScreen extends StatelessWidget {
  const ItemCheckoutScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    bool isDonated = false;
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    final String imgPath = routeArgs['imgpath'] as String;
    final itemName = routeArgs['name'] as String;
    final double price = routeArgs['price'] as double;
    final description = routeArgs['description'] as String;
    final int discount = routeArgs['discount'] as int;
    final int quantity = routeArgs['quantity'] as int;
    final int id = routeArgs['id'] as int;
    final int venueID = routeArgs['venueID'] as int;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          itemName,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            Provider.of<Counter>(context, listen: false).counter = 1;
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    imgPath,
                    width: double.infinity,
                    height: size.height * 0.4,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: Container(
                        height: size.height * 0.05,
                        width: size.width * 0.2,
                        color: Colors.black54,
                        child: Center(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              'only $quantity left',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                fontFamily: 'Caturra',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quantity',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    CounterPage(
                      size: size,
                      max: quantity,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Donate your meal?',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    DonateSwtich(
                      isDonated: isDonated,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Header(header: 'Location', size: 26),
              SizedBox(
                height: size.height * 0.02,
              ),
              LocationInfo(),
              SizedBox(height: size.height * 0.02),
              Header(header: 'Description', size: 26),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: RichText(
                    text: TextSpan(
                  text: description,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                )),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Header(header: 'Price Details', size: 26),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'actual price',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '${(price / (1 - (discount / 100))).toStringAsPrecision(4)}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.black,
                          color: Colors.grey),
                    )
                  ],
                ),
              ),
              PriceDetails(text: 'Price', number: price),
              PriceDetails(text: 'Discount', number: '$discount%'),
              Divider(
                thickness: 2,
              ),
              PriceDetails(
                text: 'Sub Total',
                number: (price * Provider.of<Counter>(context).counter)
                    .toStringAsPrecision(4),
              ),
              PriceDetails(text: 'VAT', number: '14%'),
              Divider(
                thickness: 2,
              ),
              PriceDetails(
                text: 'Total',
                number: ((price * 1.14) * Provider.of<Counter>(context).counter)
                    .toStringAsPrecision(4),
              ),
              SizedBox(
                height: size.height * 0.1,
              )
            ],
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: size.width * 0.7,
              height: size.height * 0.11,
              child: RoundedButton(
                text: 'Place order',
                onPressed: () {
                  placeOrder(
                      context,
                      ((Provider.of<Counter>(context, listen: false).counter *
                              (price * (1 - discount / 100))) *
                          1.14),
                      Provider.of<Counter>(context, listen: false).counter,
                      isDonated,
                      venueID,
                      id);
                  showAlertDialog(context);
                },
              ),
            ),
          ),
        )
      ]),
    );
  }
}
