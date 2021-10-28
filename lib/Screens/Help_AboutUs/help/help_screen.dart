import 'package:flutter/material.dart';
import 'package:maytremeesh/Components/header.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Help',
          ),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              Image.asset(
                'assets/images/Maytrmeesh_logo.png',
                height: size.height * 0.3,
                width: size.width * 0.4,
              ),
              Header(header: 'For any Inquiries', size: 22),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Header(header: 'phone', size: 22)),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(
                  '01096421725',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Header(header: 'e-mail', size: 22)),
              ),
              ListTile(
                leading: Icon(Icons.email_outlined),
                title: Text(
                  'info@maytremeesh.com',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                thickness: 1,
              ),
            ],
          ),
        ));
  }
}
