import 'package:flutter/material.dart';

class GlobalFunction{
  static Size getSize(BuildContext context){
    return MediaQuery.of(context).size;
  }
}