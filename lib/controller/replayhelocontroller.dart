import 'package:get/get.dart';
import 'package:flutter/widgets.dart';

class ReplayhelpController extends GetxController {
  var help = TextEditingController().obs;
  var formKey = GlobalKey<FormState>().obs;

  void submitForm() {
    if (formKey.value.currentState!.validate()) {
      // Handle form submission
      print("Form is valid");
      // Perform your logic here
    } else {
      print("Form validation failed");
    }
  }
}
