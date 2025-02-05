import 'package:get/get.dart';
import 'package:supcar/constent/messege.dart';

class Valid {
  String messegeInputEmpty = '108'.tr;
  String messegeInputMin = '109'.tr;
  String messegeInputMax = '110'.tr;

  vaidInput(String val, int min, int max) {
    if (val.length > max) {
      return messegeInputMax;
    }
    if (val.isEmpty) {
      return messegeInputEmpty;
    }
    if (val.length < min) {
      return messegeInputMin;
    }
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Please enter a password';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    return null;
  }
}
