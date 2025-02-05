import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';
import 'package:supcar/main.dart';
import 'package:supcar/model/userModel.dart';

class Logincontroller extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var isLoading = false.obs;

  void login() async {
    isLoading.value = true;

    String url = '$serverLink$loginLink';
    print(url);
    var response = await ApiService()
        .postRequest1(url, {"email": email.text, "password": password.text});
    isLoading.value = false;
    User user;
    if (response != null && response['message'] == 'login successfully') {
      print(response['message']);
      var responseuser = response['user'];
      var token = response['token'];
      sharedPref.setString('token', token);
      user = User.fromJson(responseuser);
      sharedPref.setString('first_name', user.firstName);
      sharedPref.setString('second_name', user.secondName);
      sharedPref.setString('email', user.email);
      sharedPref.setString('id', user.id.toString());
      if (user.type == 'doctor') {
        Get.toNamed('doctorhome');
        return;
      } else if (user.type == 'volunteer') {
        Get.toNamed('volunteerhome');
        return;
      } else if (user.type == 'patient') {
        Get.toNamed('home');
        return;
      }

      Get.snackbar('120'.tr, '121'.tr, backgroundColor: pink);
    } else {
      print('Error: ${response['message']}');
    }
  }
}
