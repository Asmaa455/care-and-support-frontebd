import 'package:get/get.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';
import 'package:supcar/model/helpModel.dart';

class HelpController extends GetxController {
  var help = <HelpModel>[].obs;
  var isLoading = true.obs; // Observable loading state
  int patientId = 1;
  @override
  void onInit() {
    fetchHelpforPatient();
    super.onInit();
  }

  fetchHelpforPatient() async {
    String url = '$serverLink$patientAidLink';
    print(url);
    try {
      isLoading(true);
      var helps = await ApiService().fetchHelp(url);
      print(helps);
      help.assignAll(helps);
    } finally {
      isLoading(false);
    }
  }
}
