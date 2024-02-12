import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasteButton extends StatefulWidget {
  const PasteButton({Key? key, required this.sinavKodu}) : super(key: key);

  final TextEditingController sinavKodu;

  @override
  State<PasteButton> createState() => _PasteButtonState();
}

class _PasteButtonState extends State<PasteButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.paste),
      onPressed: () async {
        // Panodaki veriyi al
        ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
        if (data != null) {
          // Metin alanını güncelle
          setState(() {
            widget.sinavKodu.text = data.text!.replaceAll(" ", "");
          });
        }
      },
    );
  }
}
