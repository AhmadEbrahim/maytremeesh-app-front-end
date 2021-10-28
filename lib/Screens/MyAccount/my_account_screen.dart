import 'package:flutter/material.dart';
import 'package:maytremeesh/Components/rounded_input_field.dart';
import 'package:maytremeesh/Components/rounded_password_field.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Account',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/Maytrmeesh_logo.png',
            height: size.height * 0.2,
            width: size.width * 0.4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Wrap(
              children: [
                Text(
                  'Full Name:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                RoundedInputField(
                  hintString: 'change your name',
                  icon: Icons.person,
                  keyboardType: TextInputType.text,
                  controller: TextEditingController(),
                )
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Wrap(
              children: [
                Text(
                  'Phone Number:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                RoundedInputField(
                    hintString: 'change your phone number',
                    icon: Icons.phone,
                    controller: TextEditingController(),
                    keyboardType: TextInputType.number)
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: size.height * 0.02,
            ),
          ),
          Text(
            'Password',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Wrap(
              children: [
                Text(
                  'Old Password:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                RoundedPasswordField(
                    controller: TextEditingController(),
                    hintString: 'Enter your old password'),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  'New Password:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                RoundedPasswordField(
                    controller: TextEditingController(),
                    hintString: 'change your password'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
