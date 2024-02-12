import 'package:flutter/material.dart';

class TextFieldBox extends StatelessWidget {
  const TextFieldBox({super.key, required this.controller, required this.decoration});

  final TextEditingController controller;
  final InputDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200,
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: decoration,
        ));
  }
}

Widget newTextfieldBox(TextEditingController controller, InputDecoration? decoration, width) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      width: width,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.center,
        controller: controller,
        decoration: decoration,
      ),
    ),
  );
}
