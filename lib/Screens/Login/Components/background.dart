import 'dart:ui';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(children: [
      new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage('assets/images/Login.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: Container(
                  height: size.height * 0.45,
                  width: size.width * 0.85,
                  color: Colors.white,
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    ]);
  }
}
