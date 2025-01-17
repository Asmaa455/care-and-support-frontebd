import 'dart:typed_data';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supcar/content/imagepiker.dart';

class Asdoctorcontroller extends GetxController {
  var profileImage = Rxn<Uint8List>(); // Make image observable
  var certificationImage = Rxn<Uint8List>(); // Make image observable
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController connectionInformation = TextEditingController();

  var selectedValueSpecialites = ''.obs;
  final dropDownKey = GlobalKey<DropdownSearchState>();

  List<String> medicalSpecialties = [
    '40'.tr,
    '41'.tr,
    '42'.tr,
    '43'.tr,
    '44'.tr,
    '45'.tr,
    '46'.tr,
    '47'.tr,
    '48'.tr,
    '49'.tr,
    '50'.tr,
    '51'.tr,
    '52'.tr,
    '53'.tr,
    '54'.tr,
    '55'.tr,
    '56'.tr,
    '57'.tr,
    '58'.tr,
    '59'.tr,
    '60'.tr,
    '61'.tr,
    '62'.tr,
    '63'.tr,
    '64'.tr,
    '65'.tr,
    '66'.tr,
    '67'.tr,
    '68'.tr,
  ];
  void setSelectedValueSpecialites(String? value) {
    selectedValueSpecialites.value = value!;
  }

  selectProfileImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    if (img != null) {
      profileImage.value = img; // Update the observable variable
    }
  }

  selectCertificationImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    if (img != null) {
      certificationImage.value = img; // Update the observable variable
    }
  }
}
