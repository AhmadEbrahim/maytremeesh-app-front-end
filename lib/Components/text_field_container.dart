import 'package:flutter/material.dart';

class TextFieldConatiner extends StatelessWidget {
  final Widget child;
  const TextFieldConatiner({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.75,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: Color(0xffe7e7e7), borderRadius: BorderRadius.circular(29)),
      child: child,
    );
  }
}
