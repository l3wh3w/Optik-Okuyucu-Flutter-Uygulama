import 'package:flutter/material.dart';

class ProjectStyle {
  static TextStyle projectTextStyle = const TextStyle(
    color: Colors.black,
    fontSize: 16,
  );

  static InputDecoration textFieldInputDecoration(labelText) {
    return InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: Colors.greenAccent,
              width: 3,
            )),
        labelStyle: const TextStyle(
          fontSize: 16,
        ),
        floatingLabelAlignment: FloatingLabelAlignment.center);
  }

  static EdgeInsets cardMargin() => const EdgeInsets.symmetric(vertical: 4, horizontal: 8);
  static EdgeInsets yazilarPadding() => const EdgeInsets.all(8);
  static TextAlign yazilarAlign() => TextAlign.center;
}
