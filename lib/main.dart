import 'package:charles_app/View/splash.dart';
import 'package:flutter/material.dart';

import 'View/login/Loginnn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFFF0000),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashTest(),
    );
  }
}