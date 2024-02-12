import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyButton extends StatefulWidget {
  const CopyButton({
    super.key,
    required this.sinavKoduSave,
  });

  final TextEditingController sinavKoduSave;

  @override
  State<CopyButton> createState() => _CopyButtonState();
}

class _CopyButtonState extends State<CopyButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.copy),
      onPressed: () {
        // Copy text to clipboard
        Clipboard.setData(ClipboardData(text: widget.sinavKoduSave.text));

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Sınav kodu kopyalandı'),
        ));
      },
    );
  }
}
