import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:maytremeesh/Components/already_signed.dart';
import 'package:maytremeesh/Components/rounded_button.dart';
import 'package:maytremeesh/Components/rounded_input_field.dart';
import 'package:maytremeesh/Components/rounded_password_field.dart';
import 'package:maytremeesh/Provider/token.dart';
import 'package:maytremeesh/Screens/Login/login_screen.dart';
import 'package:maytremeesh/Screens/SignUp/Components/background.dart';
import 'package:maytremeesh/models/customer.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import 'package:http/http.dart' as http;

bool registered = false;
Future<Customer> createUser(String name, String email, String phoneNumber,
    String dateOfBirth, String password, String confirmedPassword) async {
  final response = await http.post(
    Uri.parse('http://maytrmeesh.herokuapp.com/api/customers/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'fullname': name,
      'email': email,
      'password': password,
      'password2': confirmedPassword,
      'date_of_birth': dateOfBirth,
      'phone_number': phoneNumber,
    }),
  );
  if (response.statusCode == 201) {
    registered = true;
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
    final Size size = MediaQuery.of(context).size;
    final name = TextEditingController();
    final email = TextEditingController();
    final phoneNumber = TextEditingController();
    final password = TextEditingController();
    final confirmedPassword = TextEditingController();
    final dataOfBirth = TextEditingController();
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.095,
          ),
          Text('Sign up',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                  fontSize: 20)),
          SizedBox(height: size.height * 0.01),
          RoundedInputField(
            hintString: 'Full Name',
            icon: Icons.person,
            controller: name,
            keyboardType: TextInputType.text,
          ),
          RoundedInputField(
            hintString: 'E-mail address',
            icon: Icons.mail,
            keyboardType: TextInputType.emailAddress,
            controller: email,
          ),
          RoundedInputField(
            hintString: 'Phone Number',
            icon: Icons.phone,
            keyboardType: TextInputType.number,
            controller: phoneNumber,
          ),
          RoundedInputField(
            hintString: 'DD/MM/YYYY',
            icon: Icons.date_range,
            keyboardType: TextInputType.datetime,
            controller: dataOfBirth,
          ),
          RoundedPasswordField(
            hintString: 'Password',
            controller: password,
          ),
          RoundedPasswordField(
            hintString: 'Confirm Password',
            controller: confirmedPassword,
          ),
          SizedBox(
            height: size.height * 0.008,
          ),
          RoundedButton(
            text: 'Sign up',
            onPressed: () async {
              final Customer response = await createUser(
                  name.text,
                  email.text,
                  phoneNumber.text,
                  dataOfBirth.text,
                  password.text,
                  confirmedPassword.text);
              Provider.of<Token>(context, listen: false).token = response.token;
              if (registered) {
                Navigator.of(context).pushNamed('/home-screen');
              } else {
                print('Failed');
              }
            },
            color: navyBlue,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          AlreadySignedCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
