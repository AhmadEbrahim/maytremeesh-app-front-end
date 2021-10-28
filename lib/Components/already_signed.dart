import 'package:flutter/material.dart';

import '../constants.dart';

class AlreadySignedCheck extends StatelessWidget {
  final bool login;
  final void Function()? press;
  const AlreadySignedCheck({
    this.login = true,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? 'Don\'t have an Account?' : 'Already have an Account?',
          style: TextStyle(color: primaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? 'Sign Up' : 'Sign In',
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
