import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supcar/content/imagepiker.dart';

class Aspatientcontroller extends GetxController {
  var profileImage = Rxn<Uint8List>(); // Make image observable
  var paperToProveCancer = Rxn<Uint8List>(); // Make image observable

  TextEditingController age = TextEditingController();
  selectProfileImage() async {
    Uint8List? _img = await pickImage(ImageSource.gallery);
    if (_img != null) {
      profileImage.value = _img; // Update the observable variable
    }
  }

  selectpaperToProveCancer() async {
    Uint8List? _img = await pickImage(ImageSource.gallery);
    if (_img != null) {
      paperToProveCancer.value = _img; // Update the observable variable
    }
  }

  var selectedGender = ''.obs;
  var selectedDisease = ''.obs;

  void setSelectedGender(String gender) {
    selectedGender.value = gender;
  }

  void setSelectedDisease(String disease) {
    selectedDisease.value = disease;
  }
}
