import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage('assets/images/trial_bckground.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      child
    ]);
  }
}
