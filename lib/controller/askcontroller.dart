import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:supcar/content/crud.dart';
import 'package:supcar/constent/link.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AskController extends GetxController with Crud {
  var isLoading = false.obs;
  var formKey = GlobalKey<FormState>().obs;

  TextEditingController typeOfConsultation = TextEditingController();
  TextEditingController content = TextEditingController();
  int id = 1;
  int patientId = 1;

  void addConsultation() async {
    isLoading.value = true;

    if (formKey.value.currentState!.validate()) {
      String url =
          'https://a14c-46-213-116-125.ngrok-free.app/Medical_Consultation/doctor_answer_create/store/';
      var response = await postRequest(url, {
        "patientId": patientId.toString(),
        "consultationText": content.text,
        "updatedAt": null,
        "createdAt": DateTime.now().toIso8601String(),
      });
      isLoading.value = false;

      if (response['status'] == 'success') {
        Get.toNamed('doctorask');
      } else {
        // Handle error
      }
    }
  }
}
