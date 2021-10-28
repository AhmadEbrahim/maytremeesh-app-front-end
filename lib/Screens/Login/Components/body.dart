import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:maytremeesh/Components/already_signed.dart';
import 'package:maytremeesh/Provider/token.dart';
import 'package:maytremeesh/Screens/Login/Components/background.dart';
import 'package:maytremeesh/Components/rounded_button.dart';
import 'package:maytremeesh/Components/rounded_input_field.dart';
import 'package:maytremeesh/Components/rounded_password_field.dart';
import 'package:maytremeesh/Screens/SignUp/signup_screen.dart';
import 'package:maytremeesh/models/customer.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import 'package:http/http.dart' as http;

bool logged = false;

Future<Customer> logUserin(String username, String password) async {
  final response = await http.post(
    Uri.parse('http://maytrmeesh.herokuapp.com/api/login/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );
  if (response.statusCode == 200) {
    logged = true;
    return Customer.fromJson(jsonDecode(response.body));
  } else {
    print(response.statusCode);
    throw Exception('Failed to Register');
  }
}

class Body extends StatelessWidget {
  const Body();

  @override
  Widget build(BuildContext context) {
    final name = TextEditingController();
    final password = TextEditingController();
    final Size size = MediaQuery.of(context).size;
    return Background(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.3,
          ),
          Text('Login',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                  fontSize: 20)),
          SizedBox(
            height: size.height * 0.02,
          ),
          RoundedInputField(
              hintString: 'e-mail address',
              icon: Icons.email,
              controller: name,
              keyboardType: TextInputType.emailAddress),
          SizedBox(
            height: 0.01,
          ),
          RoundedPasswordField(
              controller: password, hintString: 'Enter your password'),
          SizedBox(
            height: size.height * 0.01,
          ),
          RoundedButton(
            text: 'Login',
            onPressed: () async {
              final Customer response = await logUserin(
                name.text,
                password.text,
              );
              Provider.of<Token>(context, listen: false).token = response.token;
              if (logged) {
                Navigator.of(context).pushNamed(
                  '/home-screen',
                );
              } else {
                print('Failed');
              }
            },
          ),
          AlreadySignedCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
          )
        ],
      ),
    ));
  }
}
