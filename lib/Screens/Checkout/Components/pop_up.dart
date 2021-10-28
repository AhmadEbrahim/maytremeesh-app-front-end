import 'package:flutter/material.dart';
import 'package:maytremeesh/Screens/Checkout/Components/another_pop_up.dart';
import '../../../constants.dart';

showAlertDialog(BuildContext context) {
  Widget okButton = TextButton(
    style:
        ButtonStyle(backgroundColor: MaterialStateProperty.all(primaryColor)),
    child: Center(
      child: Text(
        "OK",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    ),
    onPressed: () {
      showSecondAlertDialog(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Order placed successfully!"),
    content: Container(
      height: MediaQuery.of(context).size.height * .05,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: Icon(
                Icons.check_circle_outline_outlined,
                size: 40,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    ),
    elevation: 5,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
