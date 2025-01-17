import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/content/convert_time.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';

class AddhelpController extends GetxController {
  TextEditingController typeHelpController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  GlobalKey<FormState> formstate1 = GlobalKey();
  var isLoading = false.obs;
  int patientId = 1;
  var dateFirst = DateTime.now().obs;
  var clickedDateFirst = false.obs;

  final FocusNode typeHelpFocusNode = FocusNode();
  final FocusNode locationFocusNode = FocusNode();
  final FocusNode detailsFocusNode = FocusNode();

  @override
  void dispose() {
    typeHelpFocusNode.dispose();
    locationFocusNode.dispose();
    detailsFocusNode.dispose();
    super.dispose();
  }

  void createAid() async {
    // Logic to create a post
    isLoading.value = true;

    if (formstate1.currentState != null &&
        formstate1.currentState!.validate()) {
      String url = '$serverLink$createAidLink$patientId';

      var response = await ApiService().postRequest1(url, {
        "aid_type": typeHelpController.text,
        "aid_date": getFormattedDate(dateFirst.value),
        "location": locationController.text,
        'additional_details': detailsController.text
      });
      isLoading.value = false;

      if (response != null &&
          response['message'] == 'Ask for help created successfully') {
        // categoryController.text = '';
        // titleController.text = '';
        // contentController.text = '';

        Get.back();
        Get.snackbar('69'.tr, '87'.tr, backgroundColor: pink);
      } else {
        print('Error: ${response['message']}');
      }
    } else {
      isLoading.value = false;
      print('Form validation failed');
    }
  }

  Future<DateTime?> firstSelectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateFirst.value,
      firstDate: DateTime(1999),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != dateFirst.value) {
      dateFirst.value = picked;
      clickedDateFirst.value = true;
    }

    return picked;
  }
}
