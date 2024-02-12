import 'package:flutter/material.dart';
import 'package:im_upload/core/constant/static/base_state.dart';

class CheckPermissionButton extends StatelessWidget with BaseStatelessWidget {
  final Function() onPressed; // Fonksiyonun tipini Function() olarak değiştirdik
  final String text;
  final IconData icon;

  const CheckPermissionButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dynamicWidth(context, 30),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
        ),
        onPressed: onPressed,
        label: Text(text),
        icon: Icon(icon),
      ),
    );
  }
}
