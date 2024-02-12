import 'package:flutter/material.dart';
import 'package:im_upload/core/constant/static/base_state.dart';
import 'package:im_upload/core/constant/static/style.dart';
import 'package:im_upload/product/custom_widgets/ara_text.dart';
import 'package:im_upload/product/custom_widgets/check_permission_button.dart';
import 'package:im_upload/product/custom_widgets/paste_button.dart';
import 'package:im_upload/product/custom_widgets/delete_icon_button.dart';
import 'package:im_upload/product/custom_widgets/servis_calistir.dart';
import 'package:im_upload/product/custom_widgets/textfield_box.dart';
import 'package:im_upload/product/state/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class BirinciSayfa extends StatefulWidget {
  const BirinciSayfa({Key? key}) : super(key: key);

  @override
  State<BirinciSayfa> createState() => _BirinciSayfaState();
}

class _BirinciSayfaState extends BaseStatefulWidget<BirinciSayfa> {
  TextEditingController sinavKodu = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final hesaplamaProvider = Provider.of<HesaplamaProvider>(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: dynamicHeight(25),
          ),
          newTextfieldBox(sinavKodu, ProjectStyle.textFieldInputDecoration("Sınav Kodunu Girin"), dynamicWidth(70)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PasteButton(
                sinavKodu: sinavKodu,
              ),
              DeleteIcon(onPressed: () {
                sinavKodu.clear();
                setState(() {});
              })
            ],
          ),
          const AraText(text: "Optik formun fotoğarfını seçin"),
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
          const AraText(text: "Optik formu analiz edin"),
          ServisCalistir(onPressed: () => hesaplamaProvider.getResponse(sinavKodu.text)),
        ],
      ),
    );
  }
}
