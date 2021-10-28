import 'package:flutter/material.dart';
import 'package:maytremeesh/Components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintString;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const RoundedInputField({
    required this.hintString,
    required this.icon,
    required this.controller,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldConatiner(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintString,
            icon: Icon(
              icon,
              color: Colors.blueGrey,
            ),
            border: InputBorder.none),
        keyboardType: keyboardType,
      ),
    );
  }
}
