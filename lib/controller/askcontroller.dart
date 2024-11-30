import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:supcar/content/crud.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';

class AskController extends GetxController with Crud {
  var isLoading = false.obs;
  GlobalKey<FormState> formstate1 = GlobalKey();

  TextEditingController content = TextEditingController();
  int id = 1;
  int patientId = 1;

  @override
  void onInit() {
    super.onInit();
    addConsultation(patientId);
  }

  void addConsultation(int patientId) async {
    isLoading.value = true;

    if (formstate1.currentState != null &&
        formstate1.currentState!.validate()) {
      String url = '$serverLink$createConsultationLink$patientId';

      var response = await ApiService().postRequest1(url, {
        "consultation_text": content.text.toString(),
      });
      isLoading.value = false;
      print(" ask: $response");

      if (response != null && response['success'] == 'successfully') {
        Get.offNamed('doctorask');
      } else {
        print('Error: ${response['message']}');
      }
    } else {
      isLoading.value = false;
      print('Form validation failed');
    }
  }
}
