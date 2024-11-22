import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/content/consultation.dart';
import 'package:supcar/view/doctor/viewpostfordoctor.dart';

class DoctorHomeController extends GetxController {
  var selectedIndex = 0.obs;
  List<Widget> listWidget = [Viewpostfordoctor(), Consultation()];

  void updateIndex(int index) {
    selectedIndex.value = index;
  }
}
