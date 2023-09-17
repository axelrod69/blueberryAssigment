import 'package:flutter/material.dart';

class SizedVariables {
  static double getHeight(context) {
    return MediaQuery.of(context).size.height * 1;
  }

  static double getWidth(context) {
    return MediaQuery.of(context).size.width * 1;
  }
}
