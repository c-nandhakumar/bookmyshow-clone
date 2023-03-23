import 'package:flutter/material.dart';

class ScreenSize {
  double? height, width;
  void init(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    height = mediaQuery.size.height;
    width = mediaQuery.size.width;
  }

  // double? custHeight() => height;
  // double? custWidth() => width;
}
