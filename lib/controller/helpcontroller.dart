import 'package:get/get.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';
import 'package:supcar/model/helpModel.dart';

class HelpController extends GetxController {
  var status = true.obs;
  var help = <HelpModel>[].obs;
  var isLoading = true.obs; // Observable loading state
  int patientId = 1;
  @override
  void onInit() {
    fetchHelp();
    super.onInit();
  }

  fetchHelp() async {
    try {
      isLoading(true);
      var helps = await ApiService().fetchhelpForPatient(patientId);
      help.assignAll(helps);
    } finally {
      isLoading(false);
    }
  }
}
