import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:supcar/constent/link.dart';
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
    fetchReplayDone();
  }

  void fetchReplayDone() async {
    String url = '$serverLink$consultationPatient';
    try {
      isLoading(true);
      var fetchedUsers = await ApiService().fetchConsultation(url);
      consultations.assignAll(fetchedUsers); // Update the observable list
    } finally {
      isLoading(false);
    }
  }
}
