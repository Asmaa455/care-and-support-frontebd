// ignore_for_file: avoid_print

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';
import 'package:supcar/main.dart';
import 'package:supcar/model/doctorModel.dart';

class Doctorsearchcontroller extends GetxController {
  TextEditingController name = TextEditingController();
  var alldoctor = <Doctor>[].obs;
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
  var yEng = [
    'Damascus',
    'Aleppo',
    'Homs',
    'Idlib',
    'Raqqa',
    'Deir ez-Zor',
    'Latakia',
    'Tadmor',
  ].obs;
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
  var selectedValuelocation = ''.obs;
  var selectedValueSpecialites = ''.obs;
  var filteredSpecialties = <String>[].obs;
  var searchQuery = ''.obs;
  final dropDownKey = GlobalKey<DropdownSearchState>();
  var isLoading = true.obs;

  void setSelectedValue(String? value) {
    selectedValuelocation.value = value!;
  }

  void setSelectedValueSpecialites(String? value) {
    selectedValueSpecialites.value = value!;
  }

  fetchAllDoctor() async {
    try {
      isLoading(true);
      var fetchDoctor = await ApiService().fetchDoctor();
      print(fetchDoctor);
      alldoctor.assignAll(fetchDoctor);
      print(alldoctor[0].profilePicture);
    } finally {
      isLoading(false);
    }
  }

  fetchSearchDoctor() async {
    try {
      isLoading(true);
      var fetchDoctor = await ApiService().searchDoctor(name.text,
          selectedValueSpecialites.value, selectedValuelocation.value);
      print(fetchDoctor);
      alldoctor.assignAll(fetchDoctor);
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchAllDoctor();
  }
}
