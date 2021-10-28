import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationInfo extends StatelessWidget {
  const LocationInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'You can see the venue location ',
                style: TextStyle(color: Colors.black, fontSize: 18)),
            TextSpan(
              text: 'here',
              style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              recognizer: new TapGestureRecognizer()
                ..onTap = () {
                  launch('https://goo.gl/maps/f72tFKkDpNMHey2G6');
                },
            )
          ]),
        ),
      ),
    );
  }
}
