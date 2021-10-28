import 'package:flutter/material.dart';
import 'package:maytremeesh/Components/rounded_button.dart';
import 'package:maytremeesh/Screens/Help&AboutUs/about/about_us_screen.dart';
import 'package:maytremeesh/Screens/Help&AboutUs/help/help_screen.dart';
import 'package:maytremeesh/Screens/History/history_screen.dart';
import 'package:maytremeesh/Screens/Home/Components/drawer_tile.dart';
import 'package:maytremeesh/Screens/MyAccount/my_account_screen.dart';
import 'package:maytremeesh/constants.dart';

void signOut(BuildContext context) {
  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
}

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Drawer(
      child: Column(
        children: [
          Stack(children: [
            Container(
              height: size.height * 0.25,
              width: double.infinity,
              padding: EdgeInsets.all(size.height * 0.01),
              alignment: Alignment.center,
              color: primaryColor,
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/white_logo.png',
                  height: size.height * 0.15,
                  width: size.width * 0.4,
                ),
              ),
            )
          ]),
          SizedBox(height: size.height * 0.02),
          DrawerListTile(
            icon: Icons.person,
            text: 'My account',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MyAccountScreen();
                  },
                ),
              );
            },
          ),
          SizedBox(height: size.height * 0.02),
          DrawerListTile(
            icon: Icons.history,
            text: 'History',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HistoryScreen();
                  },
                ),
              );
            },
          ),
          SizedBox(height: size.height * 0.02),
          DrawerListTile(
            icon: Icons.help_outline,
            text: 'Help',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HelpScreen();
                  },
                ),
              );
            },
          ),
          SizedBox(height: size.height * 0.02),
          DrawerListTile(
            icon: Icons.info_outline,
            text: 'About us',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AboutUsScreen();
                  },
                ),
              );
            },
          ),
          SizedBox(
            height: size.height * 0.26,
          ),
          RoundedButton(
              text: 'Sign out',
              onPressed: () {
                signOut(context);
              })
        ],
      ),
    );
  }
}
