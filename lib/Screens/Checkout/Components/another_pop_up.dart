import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants.dart';

showSecondAlertDialog(BuildContext context) {
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
      Navigator.pop(context);
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    title: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
            text: 'Please head to the venue ',
            style: TextStyle(color: Colors.black, fontSize: 18)),
        TextSpan(
          text: 'Location',
          style: new TextStyle(
              color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
          recognizer: new TapGestureRecognizer()
            ..onTap = () {
              launch('https://goo.gl/maps/f72tFKkDpNMHey2G6');
            },
        ),
        TextSpan(
            text: ' to receive your meal!',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ))
      ]),
    ),
    content: Container(
      height: MediaQuery.of(context).size.height * .05,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: Icon(
                Icons.location_on,
                size: 40,
                color: Colors.black,
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
