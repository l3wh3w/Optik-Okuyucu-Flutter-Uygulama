import 'package:flutter/material.dart';
import 'package:im_upload/core/constant/static/base_state.dart';
import 'package:im_upload/core/constant/static/style.dart';
import 'package:im_upload/product/custom_widgets/ara_text.dart';
import 'package:im_upload/product/custom_widgets/check_permission_button.dart';
import 'package:im_upload/product/custom_widgets/copy_icon_button.dart';
import 'package:im_upload/product/custom_widgets/delete_icon_button.dart';
import 'package:im_upload/product/custom_widgets/servis_calistir.dart';
import 'package:im_upload/product/custom_widgets/textfield_box.dart';
import 'package:im_upload/product/state/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AnswerKey extends StatefulWidget {
  const AnswerKey({super.key});

  @override
  State<AnswerKey> createState() => _AnswerKeyState();
}

class _AnswerKeyState extends BaseStatefulWidget<AnswerKey> {
  TextEditingController sinavKoduSave = TextEditingController();
  bool checkBoxValue = false;

  final HesaplamaProvider hesaplamaProvider = HesaplamaProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HesaplamaProvider>(
      create: (context) => hesaplamaProvider,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text("Cevap Anahtarı Yükleme"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              newTextfieldBox(
                  sinavKoduSave, ProjectStyle.textFieldInputDecoration("Sınav Kodunu Girin"), dynamicWidth(70)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CopyButton(sinavKoduSave: sinavKoduSave),
                  DeleteIcon(onPressed: () {
                    sinavKoduSave.clear();
                    setState(() {});
                  })
                ],
              ),
              const AraText(text: "Cevap anahtarının fotoğarfını seçin"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CheckPermissionButton(
                      onPressed: () => hesaplamaProvider.checkPermission(ImageSource.gallery),
                      text: "Galeri",
                      icon: Icons.photo),
                  CheckPermissionButton(
                    onPressed: () => hesaplamaProvider.checkPermission(ImageSource.camera),
                    text: "Kamera",
                    icon: Icons.camera,
                  ),
                ],
              ),
              const AraText(text: "Cevap anahtarını yükleyin"),
              ServisCalistir(onPressed: () => hesaplamaProvider.saveAnswerKey(sinavKoduSave))
            ],
          ),
        ),
      ),
    );
  }
}
