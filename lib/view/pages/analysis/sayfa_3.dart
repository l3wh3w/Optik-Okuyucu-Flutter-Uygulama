import 'package:flutter/material.dart';
import 'package:im_upload/core/constant/static/response.dart';
import 'package:im_upload/core/constant/static/base_state.dart';

class UcuncuSayfa extends StatefulWidget {
  const UcuncuSayfa({super.key});

  @override
  State<UcuncuSayfa> createState() => _UcuncuSayfaState();
}

class _UcuncuSayfaState extends State<UcuncuSayfa> {
  String baseUrl = "http://sorgu.parpek.com";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ResponseData.isLoading == null
          ? const Center(child: CircularProgressIndicator())
          : ResponseData.isLoading == true
              ? Image.network(
                  baseUrl + ResponseData.finalAnsFile!,
                  // Resmin alınırken gösterilecek yedek resim
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    }
                  },
                  // Resmin alınamaması durumunda gösterilecek yedek resim
                  errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    );
                  },
                )
              : Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Center(
                    child: Text(
                      "Bir sorun oluştu",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
    );
  }
}
