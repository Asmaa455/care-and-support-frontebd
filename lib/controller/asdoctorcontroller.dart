import 'dart:typed_data';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/content/imagepiker.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';

class Asdoctorcontroller extends GetxController {
  var profileImage = Rxn<Uint8List>(); // Make image observable
  var certificationImage = Rxn<Uint8List>(); // Make image observable
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController connectionInformation = TextEditingController();
  var isLoading = false.obs;
  GlobalKey<FormState> formstate1 = GlobalKey();

  var selectedValueSpecialites = ''.obs;
  final dropDownKey = GlobalKey<DropdownSearchState>();
  var selectedValueCity = ''.obs;
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
  List<String> medicalSpecialtiesEng = [
    'Anesthesia',
    'Emergency Medicine',
    'Family Medicine',
    'Internal Medicine',
    'Medical Genetics',
    'Neurology',
    'Obstetrics and Gynecology',
    'Ophthalmology',
    'Orthopedic Surgery',
    'Otolaryngology',
    'Pediatrics',
    'Psychiatry',
    'Radiology',
    'Surgery',
    'Urology',
    'Pathology',
    'Rehabilitation Medicine',
    'Preventive Medicine',
    'Public Health',
    'Allergy and Immunology',
    'Cardiology',
    'Endocrinology',
    'Gastroenterology',
    'Hematology',
    'Infectious Disease',
    'Nephrology',
    'Oncology',
    'Pulmonary Medicine',
    'Rheumatology',
    'Sports Medicine'
  ];
  var city = [
    '32'.tr,
    '33'.tr,
    '34'.tr,
    '35'.tr,
    '36'.tr,
    '37'.tr,
    '38'.tr,
    '39'.tr,
  ].obs;
  var cityEng = [
    'Damascus',
    'Aleppo',
    'Homs',
    'Idlib',
    'Raqqa',
    'Deir ez-Zor',
    'Latakia',
    'Tadmor',
  ].obs;
  String translateCityToEnglish(String arabicValue) {
    int index = city.indexOf(arabicValue);
    if (index != -1) {
      return cityEng[index];
    }
    return arabicValue;
  }

  String translateSpecialtyToEnglish(String arabicValue) {
    int index = medicalSpecialties.indexOf(arabicValue);
    if (index != -1) {
      return medicalSpecialtiesEng[index];
    }
    return arabicValue;
  }

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

  void createAcount() async {
    isLoading.value = true;

    if (formstate1.currentState != null &&
        formstate1.currentState!.validate()) {
      String url = '$serverLink$signUp';
      print(url);
      var response = await ApiService().postRequest1(url, {
        // "first_name": firstName.text,
        // "second_name": secondName.text,
        // "email": email.text,
        // "password": password.text
      });
      isLoading.value = false;
      if (response != null &&
          response['message'] == 'User registered successfully') {
        print(response['message']);

        Get.offNamed('loginas');
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
