import 'package:flutter/material.dart';

class DeleteIcon extends StatelessWidget {
  final VoidCallback onPressed;

  const DeleteIcon({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: onPressed,
    );
  }
}
