import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:supcar/constent/link.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';
import 'package:supcar/model/conModel.dart';

class ConsultationController extends GetxController {
  var replay = TextEditingController();
  var formKey = GlobalKey<FormState>().obs;
  var isLoading = false.obs;
  var consultations = <Consultations>[].obs;
  int id = 1;
  int doctorId = 1;

  @override
  void onInit() {
    super.onInit();
    fetchConsultations();
  }

  Future<void> fetchConsultations() async {
    String url = '$serverLink$consultationForDoctorLink';
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body) as List;
        consultations.value =
            responseBody.map((json) => Consultations.fromJson(json)).toList();
      } else {
        print('ERROR ${response.statusCode}');
      }
    } catch (e) {
      print('ERROR CATCH $e');
    }
  }

  // Future<void> replayConsultation(int patientId) async {
  //   isLoading.value = true;
  //   if (formKey.value.currentState!.validate()) {
  //     String url =
  //         'https://d7f3-5-0-138-106.ngrok-free.app/Medical_Consultation/doctor_answer_create/store/';
  //     var response = await http.post(Uri.parse(url), body: {
  //       "patientId": patientId.toString(),
  //       "answer_text": replay.text,
  //       "updatedAt": DateTime.now().toIso8601String(),
  //     });
  //     isLoading.value = false;
  //     if (jsonDecode(response.body)['status'] == 'success') {
  //       Get.offNamed('consultation');
  //     } else {
  //       // Handle error
  //     }
  //   }
  //   isLoading.value = false;
  // }
}

class NotReplayController extends GetxController {
  var replay = TextEditingController();
  GlobalKey<FormState> formstate1 = GlobalKey();
  var isLoading = false.obs;
  var consultations = <Consultations>[].obs;
  int id = 1;
  int doctorId = 1;
  @override
  void onInit() {
    super.onInit();
    fetchNotReplay();
  }

  void fetchNotReplay() async {
    String url = '$serverLink$unansweredMedicalConsultations';
    try {
      isLoading(true);
      var fetchedUsers = await ApiService().fetchConsultation(url, id);
      consultations.assignAll(fetchedUsers); // Update the observable list
    } finally {
      isLoading(false);
    }
  }

  void addAnswered(int idConsul) async {
    isLoading.value = true;

    if (formstate1.currentState != null &&
        formstate1.currentState!.validate()) {
      String url = '$serverLink$createAnswered$doctorId/$idConsul';

      var response = await ApiService().postRequest1(url, {
        "doctor_id": doctorId.toString(),
        "answer_text": replay.text.toString(),
      });
      isLoading.value = false;

      if (response != null &&
          response['message'] == 'Answer stored successfully') {
        Get.toNamed('consultation');
      } else {
        print('Error: ${response['message']}');
      }
    } else {
      isLoading.value = false;
      print('Form validation failed');
    }
  }
}
