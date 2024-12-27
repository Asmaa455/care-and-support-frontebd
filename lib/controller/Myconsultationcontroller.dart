import 'package:get/get.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';
import 'package:supcar/model/conModel.dart';

class Myconsultationcontroller extends GetxController {
  var consultations = <Consultations>[].obs;
  int doctorId = 1;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    consultationForDoc();
  }

  void consultationForDoc() async {
    String url = '$serverLink$doctorAnswered';
    try {
      isLoading(true);
      var fetchedUsers = await ApiService().fetchConsultation(url, doctorId);
      consultations.assignAll(fetchedUsers); // Update the observable list
    } finally {
      isLoading(false);
    }
  }
}
