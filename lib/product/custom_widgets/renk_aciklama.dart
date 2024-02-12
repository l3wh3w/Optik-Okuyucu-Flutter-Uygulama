import 'package:flutter/material.dart';

Widget renkAciklama(Color color, String text) {
  return Row(children: [
    Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    ),
    const SizedBox(width: 8),
    Text(text),
  ]);
}
