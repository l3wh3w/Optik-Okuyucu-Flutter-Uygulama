import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:im_upload/core/constant/static/response.dart';
import 'package:im_upload/core/constant/model/optik_model.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadService {
  Dio dio = Dio();
  String baseUrl = "http://sorgu.parpek.com";
  Future<OptikModel?> uploadImage(XFile? pickedFile, String? sinavKodu) async {
    try {
      if (pickedFile != null) {
        FormData imageFormData = FormData.fromMap({
          'image': await MultipartFile.fromFile(pickedFile.path, filename: 'image.jpg'),
          'sinavKodu': ResponseData.sinavKodu, // Convert sinavKodu to String
        });

        Response response = await dio.post(
          '$baseUrl/sendImage', // Update the endpoint for image upload
          data: imageFormData,
        );

        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.data);
          OptikModel optikModel = OptikModel.fromJson(jsonData);
          print(response.data);
          return optikModel;
        } else {
          print('Failed to upload image. Status code: ${response.statusCode}');
          return null;
        }
      } else {
        print('No file selected');
        return null;
      }
    } catch (error) {
      print('Error during image upload: $error');
      return null;
    }
  }

  Future<void> saveAnswerKey(XFile? pickedFile, String? sinavKodu) async {
    try {
      if (pickedFile != null && sinavKodu != null) {
        FormData saveAnswerKeyFormData = FormData.fromMap({
          'image': await MultipartFile.fromFile(pickedFile.path, filename: 'image.jpg'),
          'sinavKodu': sinavKodu,
        });

        Response response = await dio.post(
          '$baseUrl/answerKey',
          data: saveAnswerKeyFormData,
        );

        if (response.statusCode == 200) {
          print(response.data);
        } else {
          print('Failed to save answer key. Status code: ${response.statusCode}');
        }
      } else {
        print('No file selected');
      }
    } catch (error) {
      print('Error during answer key save: $error');
    }
  }
}
