import 'package:flutter/material.dart';
import 'package:maytremeesh/Provider/location.dart';
import 'package:maytremeesh/constants.dart';
import 'package:provider/provider.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.location_on),
        DropdownButton<String>(
          value: Provider.of<Location>(context).location,
          onChanged: (String? location) {
            setState(() {
              Provider.of<Location>(context, listen: false).location =
                  location!;
              Navigator.of(context).pushReplacementNamed(
                '/home-screen',
              );
            });
          },
          hint: Text(
            'Enter your location',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w100),
          ),
          items: <String>['6th October', 'Dokki', 'El-Haram', 'Maadi']
              .map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: new Text(
                value,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            );
          }).toList(),
          elevation: 0,
          iconEnabledColor: Colors.white,
          iconSize: 26,
          dropdownColor: primaryColor,
        ),
      ],
    );
  }
}
