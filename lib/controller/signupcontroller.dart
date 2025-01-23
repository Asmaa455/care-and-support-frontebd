import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';
import 'package:supcar/main.dart';
import 'package:supcar/model/userModel.dart';

class Signupcontroller extends GetxController {
  GlobalKey<FormState> formstate1 = GlobalKey();
  TextEditingController firstName = TextEditingController();
  TextEditingController secondName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController conformePassword = TextEditingController();
  var obscureText = true.obs;
  var isLoading = false.obs;

  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  void createAcount() async {
    isLoading.value = true;

    if (formstate1.currentState != null &&
        formstate1.currentState!.validate()) {
      String url = '$serverLink$signUp';
      print(url);
      var response = await ApiService().postRequest1(url, {
        "first_name": firstName.text,
        "second_name": secondName.text,
        "email": email.text,
        "password": password.text,
        "password_confirmation": conformePassword.text
      });
      isLoading.value = false;
      User user;
      if (response != null &&
          response['message'] == 'User registered successfully') {
        print(response['message']);

        Get.offNamed('login');
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
