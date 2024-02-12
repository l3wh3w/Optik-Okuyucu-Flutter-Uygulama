import 'package:flutter/material.dart';
import 'package:im_upload/core/constant/static/base_state.dart';
import 'package:im_upload/product/custom_widgets/renk_aciklama.dart';
import 'package:im_upload/core/constant/static/response.dart';

class DorduncuSayfa extends StatelessWidget with BaseStatelessWidget {
  const DorduncuSayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (columnIndex) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(10, (index) {
                        int questionNumber = columnIndex * 10 + index + 1;
                        Color cellColor = Colors.blue;
                        if (ResponseData.allCorrect != null) {
                          if (ResponseData.allCorrect!.contains(questionNumber)) {
                            cellColor = Colors.green;
                          } else if (ResponseData.allWrong != null) {
                            if (ResponseData.allWrong!.contains(questionNumber)) {
                              cellColor = Colors.red;
                            }
                          }
                        }
                        return Container(
                          height: dynamicHeight(context, 6.3),
                          width: dynamicWidth(context, 18),
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: cellColor,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: Text(
                              questionNumber.toString(),
                              style: const TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                );
              }),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              renkAciklama(Colors.green, 'Doğru'),
              renkAciklama(Colors.red, 'Yanlış'),
              renkAciklama(Colors.blue, 'Boş'),
            ]),
          ],
        ),
      ),
    );
  }
}
