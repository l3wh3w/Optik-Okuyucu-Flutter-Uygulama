import 'package:flutter/material.dart';
import 'package:im_upload/core/constant/static/response.dart';
import 'package:im_upload/product/custom_widgets/build_list.dart';

class IkinciSayfa extends StatefulWidget {
  const IkinciSayfa({Key? key}) : super(key: key);

  @override
  State<IkinciSayfa> createState() => _IkinciSayfaState();
}

class _IkinciSayfaState extends State<IkinciSayfa> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (ResponseData.isLoading == null)
              const CircularProgressIndicator()
            else if (ResponseData.isLoading == true)
              _buildSuccessContent()
            else
              _buildErrorContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildListTile("Öğrenci Numarası", ResponseData.studentId, Icons.person),
        const SizedBox(height: 10),
        buildListTile("Doğru Sayısı", ResponseData.totalCorrectAns, Icons.turned_in),
        const SizedBox(height: 10),
        buildListTile("Yanlış Sayısı", ResponseData.totalWrongAns, Icons.warning_amber_outlined),
        const SizedBox(height: 10),
        buildListTile("Boş Sayısı", ResponseData.totalEmptyAns, Icons.hourglass_empty),
        const SizedBox(height: 10),
        buildListTile("Puanı", ResponseData.totalScore, Icons.score_outlined),
      ],
    );
  }

  Widget _buildErrorContent() {
    return Container(
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
    );
  }
}
