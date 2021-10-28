import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DonateSwtich extends StatefulWidget {
  late bool isDonated;
  DonateSwtich({required this.isDonated});
  @override
  _DonateSwtichState createState() => _DonateSwtichState();
}

class _DonateSwtichState extends State<DonateSwtich> {
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: widget.isDonated,
      onChanged: (value) {
        setState(() {
          widget.isDonated = !widget.isDonated;
        });
      },
      activeColor: Colors.green,
    );
  }
}
