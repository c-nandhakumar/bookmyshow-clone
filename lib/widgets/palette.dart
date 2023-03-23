import 'package:flutter/material.dart';

class Palette {
  // ignore: unnecessary_const
  static const MaterialColor kToDark = const MaterialColor(
    0xff061f24, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    // ignore: unnecessary_const
    const <int, Color>{
      50: Color(0xff061f24), //10%
      100: Color(0xff051c20), //20%
      200: Color(0xff05191d), //30%
      300: Color(0xff041619), //40%
      400: Color(0xff041316), //50%
      500: Color(0xff031012), //60%
      600: Color(0xff020c0e), //70%
      700: Color(0xff02090b), //80%
      800: Color(0xff010607), //90%
      900: Color(0xff000000), //100%
    },
  );
}
