import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Widget navigateAfterSeconds;
  final int seconds;
  final Image image;
  final Color backgroundColor;
  final double photoSize;
  final Color loaderColor;

  SplashScreen({
    required this.navigateAfterSeconds,
    required this.seconds,
    required this.image,
    required this.backgroundColor,
    required this.photoSize,
    required this.loaderColor,
    required Image,
  });

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: widget.seconds), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => widget.navigateAfterSeconds),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.image,
            SizedBox(height: 20),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(widget.loaderColor),
            ),
          ],
        ),
      ),
    );
  }
}
