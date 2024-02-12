import 'package:flutter/material.dart';
import 'package:im_upload/product/custom_widgets/yonlendirme_butonu.dart';

class YonlendirmeSayfasi extends StatefulWidget {
  const YonlendirmeSayfasi({super.key});

  @override
  State<YonlendirmeSayfasi> createState() => _YonlendirmeSayfasiState();
}

class _YonlendirmeSayfasiState extends State<YonlendirmeSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Optik Okuyucu',
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            yonlendirmeButtonu("analysis", "Analiz", Colors.blue, () {
              Navigator.pushNamed(context, '/analysis');
            }),
            yonlendirmeButtonu("answer_key", "Cevap Anahtarı", Colors.green, () {
              Navigator.pushNamed(context, '/answer_key');
            }),
            yonlendirmeButtonu("optic_form", "Optik Formlar", Colors.orange, () {
              Navigator.pushNamed(context, '/optik_formlar');
            }),
          ],
        ),
      ),
    );
  }
}
