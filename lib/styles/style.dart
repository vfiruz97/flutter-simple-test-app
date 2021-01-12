import 'package:flutter/material.dart';

InputDecoration inputDecoration({@required labelText}) {
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
