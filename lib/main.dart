import 'package:flutter/material.dart';
import 'package:maytremeesh/Provider/location.dart';
import 'package:maytremeesh/Provider/token.dart';
import 'package:maytremeesh/Screens/Checkout/item_checkout_screen.dart';
import 'package:maytremeesh/Screens/Checkout/package_checkout_screen.dart';
import 'package:maytremeesh/Screens/Home/home_screen.dart';
import 'package:maytremeesh/Screens/Menu/venue_menu_screen.dart';
import 'package:maytremeesh/Screens/SignUp/signup_screen.dart';
import 'package:provider/provider.dart';
import './Screens/Login/login_screen.dart';
import './constants.dart';
import 'Provider/counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Counter()),
        ChangeNotifierProvider(create: (context) => Token()),
        ChangeNotifierProvider(create: (context) => Location())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Maytremeesh',
        theme: ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Proxima',
        ),
        home: LoginScreen(),
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (context) {
            return LoginScreen();
          });
        },
        routes: {
          '/home-screen': (context) => HomeScreen(),
          '/item-checkout-screen': (context) => ItemCheckoutScreen(),
          '/package-checkout-screen': (context) => PackageCheckoutScreen(),
          '/venue-menu': (context) => VenueMenuScreen(),
          '/signup': (context) => SignUpScreen(),
          '/login': (context) => LoginScreen()
        },
      ),
    );
  }
}
