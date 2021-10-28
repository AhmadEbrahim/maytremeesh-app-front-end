import 'package:flutter/material.dart';

import '../../../constants.dart';

class HomePageHeader extends StatelessWidget {
  final String head1;
  final String head2;

  const HomePageHeader({
    required this.head1,
    required this.head2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            head1,
            style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w600,
                fontFamily: 'Proxima'),
          ),
          Text(
            head2,
            style: TextStyle(
                color: primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.w800,
                fontFamily: 'Proxima'),
          )
        ],
      ),
    );
  }
}
