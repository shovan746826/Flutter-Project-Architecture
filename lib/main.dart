import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvvm_project/global_classes/global_function.dart';
import 'package:mvvm_project/view/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "Welcome",
            style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
