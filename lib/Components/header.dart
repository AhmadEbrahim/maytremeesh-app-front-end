import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String header;
  final double size;
  const Header({
    required this.header,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
      child: Text(
        header,
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w900,
          color: Colors.black,
          fontFamily: 'Proxima',
        ),
      ),
    );
  }
}
