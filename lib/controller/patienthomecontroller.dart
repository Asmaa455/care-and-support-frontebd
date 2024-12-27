import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/view/patient/doctorask.dart';
import 'package:supcar/view/patient/measure.dart';
import 'package:supcar/view/patient/medicine.dart';
import 'package:supcar/view/patient/patient.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  List<Widget> listwidget = [Homepatient(), Medicine(), Doctorask(), Measure()];
  List<String> nameWidget = ['Home Patient', '2'.tr, '3'.tr, '4'.tr];

  void updateIndex(int index) {
    selectedIndex.value = index;
  }
}
