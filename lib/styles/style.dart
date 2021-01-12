import 'package:flutter/material.dart';

// Colors
const grey50 = Color(0xFFECEFF1);
const grey200 = Color(0xFFB0BEC5);
const blueGrey100 = Color(0xFFCFD8DC);
const black = Colors.black;

// Styles
InputDecoration inputDecoration({@required String labelText}) {
  return InputDecoration(
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue,
        width: 1.0,
      ),
    ),
    labelText: labelText,
  );
}

TextStyle get s36BoldBlack {
  return const TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: Colors.black54,
  );
}

TextStyle get s26Bold {
  return const TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.bold,
  );
}

TextStyle get s18 {
  return const TextStyle(
    fontSize: 18.0,
  );
}

TextStyle get s20Bold {
  return const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
  );
}

TextStyle get s22BoldBlack {
  return const TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
}
