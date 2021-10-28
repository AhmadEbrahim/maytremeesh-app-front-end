import 'package:flutter/material.dart';
import 'package:maytremeesh/Components/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String hintString;

  const RoundedPasswordField({
    required this.controller,
    required this.hintString,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldConatiner(
        child: TextField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
          hintText: hintString,
          icon: Icon(Icons.lock, color: Colors.blueGrey),
          border: InputBorder.none),
    ));
  }
}
