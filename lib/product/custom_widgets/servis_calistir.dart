import 'package:flutter/material.dart';

class ServisCalistir extends StatelessWidget {
  const ServisCalistir({super.key, required this.onPressed});

  final Future<void> Function() onPressed; // Fonksiyonun tipini Future<void> Function() olarak değiştirdik

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        // Butona tıklandığında lambda fonksiyonunu çağırıyoruz
        await onPressed();
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
      ),
      label: const Text("Çalıştır"),
      icon: const Icon(Icons.send),
    );
  }
}
