import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DoctoraskController extends GetxController {
  var status = true.obs;
}

class ReplayDoneController extends GetxController {
  var consultations = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchReplayDone();
  }

  void fetchReplayDone() async {
    String myUrl =
        'https://d7f3-5-0-138-106.ngrok-free.app/Medical_Consultation/Answered_Medical_Consultation';
    try {
      var response = await http.post(Uri.parse(myUrl));
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

class NotReplayController extends GetxController {
  var consultations = [].obs;
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
