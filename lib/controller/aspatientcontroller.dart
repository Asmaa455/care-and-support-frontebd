import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/content/imagepiker.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';
import 'package:supcar/main.dart';
// import 'dart:html' as html;

class Aspatientcontroller extends GetxController {
  var profileImage = Rxn<File>(); // Make image observable
  var paperToProveCancer = Rxn<File>(); // Make image observable
  var isLoading = false.obs;
  GlobalKey<FormState> formstate1 = GlobalKey();
  TextEditingController age = TextEditingController();

// متغير Rx لإدارة صورة الملف الشخصي

  // اختيار صورة من المعرض
  // Future<void> selectProfileImageHtml() async {
  //   // فتح نافذة اختيار الصورة
  //   final html.FileUploadInputElement uploadInput =
  //       html.FileUploadInputElement();
  //   uploadInput.accept = 'image/*'; // لتحديد فقط الصور
  //   uploadInput.multiple = false; // لا تسمح باختيار أكثر من صورة في نفس الوقت

  //   uploadInput.click(); // فتح نافذة اختيار الملف

  //   uploadInput.onChange.listen((e) async {
  //     final files = uploadInput.files;
  //     if (files!.isEmpty) return;

  //     final file = files[0];

  //     // قراءة محتوى الصورة باستخدام FileReader
  //     final reader = html.FileReader();
  //     reader.readAsArrayBuffer(file);
  //     reader.onLoadEnd.listen((e) async {
  //       final imageBytes = reader.result as Uint8List;

  //       // تحديث متغير الصورة باستخدام GetX
  //       profileImage.value = imageBytes;
  //     });
  //   });
  // }

  Future<void> selectProfileImage() async {
    XFile? _img = await pickImage(ImageSource.gallery);
    if (_img != null) {
      profileImage.value = File(_img.path);
    }
  }

  selectpaperToProveCancer() async {
    Uint8List? _img = await pickImage(ImageSource.gallery);
    if (_img != null) {
      // paperToProveCancer.value = _img; // Update the observable variable
    }
  }

  Future<File> saveUint8ListAsFile(Uint8List data, String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');
    await file.writeAsBytes(data);
    return file;
  }

  var selectedGender = ''.obs;
  var selectedDisease = ''.obs;

  void setSelectedGender(String gender) {
    selectedGender.value = gender;
  }

  void setSelectedDisease(String disease) {
    selectedDisease.value = disease;
  }

  void createPateitAcount() async {
    isLoading.value = true;
    if (profileImage != null) {
      print('pootooooo');
    }

    if (formstate1.currentState != null &&
        formstate1.currentState!.validate()) {
      String url = '$serverLink$asPatient';
      print(url);
      var response = await ApiService().postRequest1WithFile(
        url,
        {
          'user_id': sharedPref.getString('id').toString(),
          'age': age.text,
          'gender': selectedGender.value,
          'diseases': selectedDisease.value,
        },
        profileImage.value!,
      );
      isLoading.value = false;
      if (response != null &&
          response['message'] == 'patient data created successfully') {
        print(response['message']);

        Get.offNamed('home');
        Get.snackbar('120'.tr, '121'.tr, backgroundColor: pink);
      } else {
        print('Error: ${response['message']}');
      }
    } else {
      isLoading.value = false;
      print('Form validation failed');
    }
  }
}
