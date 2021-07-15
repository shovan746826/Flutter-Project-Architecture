import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_project/home/bloc_pattern/home_bloc.dart';
import 'package:mvvm_project/home/repository/repository.dart';
import 'package:mvvm_project/home/view/home_screen.dart';
import 'package:mvvm_project/home/view/home_screen_bloc.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: SplashScreen(),
    // BlocProvider(
    //   create:(context)=>HomeBLoC(repository: Repository()),
    //   child: HomeScreenBLoC(),
    // ),
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

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => BlocProvider(
                create: (context) => HomeBLoC(repository: Repository()),
                child: HomeScreenBLoC(),
              )));

      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (_) => HomeScreen()));

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
