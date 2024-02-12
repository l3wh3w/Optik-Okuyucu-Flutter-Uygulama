import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget yonlendirmeButtonu(String icon, String label, Color color, Function onPressed) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(backgroundColor: color, fixedSize: const Size(300, 80)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Ikonlar solda hizalansın
        crossAxisAlignment: CrossAxisAlignment.center, // Dikeyde ortala
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0), // İkon ile metin arasındaki boşluğu ayarla
            child: SvgPicture.asset(
              'assets/icons/$icon.svg',
              width: 50, // İkonun genişliği
              height: 50, // İkonun yüksekliği
            ),
          ),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    ),
  );
}
