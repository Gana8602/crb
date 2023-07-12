import 'dart:async';

import 'package:crb/screens/dashboard.dart';
import 'package:crb/screens/login_screen.dart';
import 'package:crb/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  String email = prefs.getString('email') ?? '';
  runApp(MyApp(isLoggedIn: isLoggedIn, email: email));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  final String email;

  MyApp({required this.isLoggedIn, required this.email});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Demo',
      home: SplashScreen(
        seconds: 10,
        navigateAfterSeconds:
            isLoggedIn ? DashboardPage(email: email) : LoginPage(),
        image: Image(image: AssetImage("assets/splash.png")),
        backgroundColor: Colors.white,
        photoSize: 100.0,
        loaderColor: Colors.blue,
        Image: null,
      ),
    );
  }
}
