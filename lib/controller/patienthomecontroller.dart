import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/patient/doctorask.dart';
import 'package:supcar/patient/medicine.dart';
import 'package:supcar/patient/patient.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  List<Widget> listwidget = [Homepatient(), Medicine(), Doctorask()];
  List<String> nameWidget = ['Home Patient', 'Medicine', 'Ask Doctor '];

  void updateIndex(int index) {
    selectedIndex.value = index;
  }
}
