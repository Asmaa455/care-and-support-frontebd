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
  var isLoading = false.obs;
  var dateFirst = DateTime.now().obs;
  var clickedDateFirst = false.obs;
  var typeHelp = Rx<String?>(null);

  final FocusNode typeHelpFocusNode = FocusNode();
  final FocusNode locationFocusNode = FocusNode();
  final FocusNode detailsFocusNode = FocusNode();

  var selectedValue = ''.obs;
  var isOtherSelected = false.obs;
  var dropdownItems = ['Option 1', 'Option 2', 'Option 3', 'Other'].obs;
  @override
  void dispose() {
    typeHelpFocusNode.dispose();
    locationFocusNode.dispose();
    detailsFocusNode.dispose();
    super.dispose();
  }

  setAidType(String value) {
    typeHelp.value = value;
  }

  void createAid() async {
    // Logic to create a post
    isLoading.value = true;
    if (typeHelp.value == '146'.tr) {
      typeHelp.value = typeHelpController.text;
    }

    String url = '$serverLink$createAidLink';

    var response = await ApiService().postRequest1(url, {
      "aid_type": typeHelp.value,
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
