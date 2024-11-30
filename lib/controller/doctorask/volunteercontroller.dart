import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:supcar/view/patient/home.dart';
import 'package:supcar/view/patient/patient.dart';
import 'package:supcar/view/volunteer/showhelp.dart';

class VolunteerController extends GetxController {
  var selectedIndex = 0.obs;
  var listWidget = [Homepatient(), Showhelp()];
  var userImage = 'image/PI.jpeg';
  var username = 'username';
  var email = 'username@gmail.com';

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
