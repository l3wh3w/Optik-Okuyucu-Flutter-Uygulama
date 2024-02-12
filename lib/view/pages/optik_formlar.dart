import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ImageDownloadingScreen extends StatefulWidget {
  const ImageDownloadingScreen({super.key});
  @override
  State<ImageDownloadingScreen> createState() => _ImageDownloadingScreenState();
}

class _ImageDownloadingScreenState extends State<ImageDownloadingScreen> {
  final imgUrl = "http://sorgu.parpek.com/static/deneme.jpeg";
  String progressValue = '';

  @override
  void initState() {
    downloadImage();
    super.initState();
  }

  Future<void> downloadImage() async {
    Dio dio = Dio();
    try {
      var pathInStorage = await getApplicationDocumentsDirectory();
      await dio.download(
        imgUrl,
        '${pathInStorage.path}/sampleimage.jpg',
        onReceiveProgress: (count, total) {
          setState(() {
            progressValue = 'Downloading: ${((count / total) * 100).toStringAsFixed(0)}%';
            if (count == total) {
              progressValue = 'Downloading Completed';
            }
          });
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(progressValue),
      ),
    );
  }
}
