import 'package:flutter/material.dart';
import 'package:im_upload/core/constant/static/style.dart';

class AraText extends StatelessWidget {
  const AraText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: ProjectStyle.projectTextStyle,
      ),
    );
  }
}
