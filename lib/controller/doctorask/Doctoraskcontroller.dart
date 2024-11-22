import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:supcar/controller/apiserves/apiserves.dart';
import 'package:supcar/model/conModel.dart';

class DoctoraskController extends GetxController {
  var status = true.obs;
}

class ReplayDoneController extends GetxController {
  var consultations = <Consultations>[].obs;
  var isLoading = true.obs; // Observable loading state

  var id = 1;

  @override
  void onInit() {
    super.onInit();
    fetchReplayDone(id);
  }

  void fetchReplayDone(int id) async {
    try {
      isLoading(true);
      var fetchedUsers = await ApiService().fetchConsultation(id);
      consultations.assignAll(fetchedUsers); // Update the observable list
    } finally {
      isLoading(false);
    }
  }
}

class NotReplayController extends GetxController {
  var consultations = <Consultations>[].obs;
  var id = 1;

  @override
  void onInit() {
    super.onInit();
    fetchNotReplay(id);
  }

  void fetchNotReplay(int id) async {
    String myUrl =
        'https://d7f3-5-0-138-106.ngrok-free.app/Medical_Consultation/Unanswered_Medical_Consultations/$id';
    try {
      var response = await http.get(Uri.parse(myUrl));
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        consultations.assignAll(responsebody['consultations']);
      } else {
        print('ERROR ${response.statusCode}');
      }
    } catch (e) {
      print('ERROR CATCH $e');
    }
  }
}
