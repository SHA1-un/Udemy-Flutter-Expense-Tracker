import 'package:flutter/material.dart';

class Style {
  Style();

  InputDecoration textFieldInputDecoration(String text, Color primaryColor) {
    return InputDecoration(
      labelText: text,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: primaryColor),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: primaryColor),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
