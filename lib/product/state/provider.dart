import 'package:flutter/material.dart';
import 'package:im_upload/core/constant/static/response.dart';

import 'package:im_upload/product/service/upload_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class HesaplamaProvider extends ChangeNotifier {
  XFile? pickedFile;
  ImageUploadService uploadService = ImageUploadService();

  Future<void> getResponse(String? sinavKodu) async {
    try {
      if (sinavKodu != null) {
        ResponseData.sinavKodu = sinavKodu;
        var value = await uploadService.uploadImage(pickedFile, ResponseData.sinavKodu);
        print("boş sorular ${value?.allEmpty}");
        print(ResponseData.sinavKodu);

        if (value != null) {
          ResponseData.isLoading = true;
          ResponseData.allCorrect = value.allCorrect;
          ResponseData.allEmpty = value.allEmpty;
          ResponseData.allWrong = value.allWrong;
          ResponseData.studentId = value.studentId;
          ResponseData.totalScore = value.totalScore;
          ResponseData.finalAnsFile = value.finalAnsFile;
          ResponseData.totalCorrectAns = ResponseData.allCorrect?.length;
          ResponseData.totalEmptyAns = ResponseData.allEmpty?.length;
          ResponseData.totalWrongAns = ResponseData.allWrong?.length;
          ResponseData.finalAnsFile = value.finalAnsFile;

          notifyListeners();
        }
      }
    } catch (e) {
      // Handle errors here
      print("Error: $e");

      notifyListeners();
    }
  }

  checkPermission(source) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.storage,
    ].request();
    print("Asked for permission");
    if (statuses[Permission.camera] != PermissionStatus.granted ||
        statuses[Permission.storage] != PermissionStatus.granted) {
      return;
    }
    pickedImage(source);
    ResponseData.isLoading = null;
    ResponseData.allCorrect = null;
    ResponseData.allEmpty = null;
    ResponseData.allWrong = null;
    ResponseData.studentId = null;
    ResponseData.totalScore = null;
    ResponseData.finalAnsFile = null;
    ResponseData.totalCorrectAns = null;
    ResponseData.totalEmptyAns = null;
    ResponseData.totalWrongAns = null;

    notifyListeners();
  }

  pickedImage(source) async {
    final picker = ImagePicker();
    pickedFile = await picker.pickImage(source: source);

    notifyListeners();
  }

  Future<void> saveAnswerKey(TextEditingController sinavKodu) async {
    try {
      ResponseData.sinavKodu = sinavKodu.text;
      await uploadService.saveAnswerKey(pickedFile, ResponseData.sinavKodu);
      print(ResponseData.sinavKodu);

      notifyListeners();
    } catch (e) {
      // Handle errors here
      print("Error: $e");

      notifyListeners();
    }
  }
}
