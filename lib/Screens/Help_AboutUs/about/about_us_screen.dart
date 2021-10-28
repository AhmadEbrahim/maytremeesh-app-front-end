import 'package:flutter/material.dart';
import 'package:maytremeesh/Screens/Help&AboutUs/about/background.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Background(
        child: Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: size.height * 0.6,
              width: size.width * 0.95,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          'assets/images/Maytrmeesh_logo.png',
                          height: size.height * 0.3,
                          width: size.width * 0.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          'Maytremeesh is a social impact application driving a movement against food waste. Our app is aiming to be the largest Business to Consumer marketplace for surplus food. We connect you to various food venues so that food can be enjoyed not wasted ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
