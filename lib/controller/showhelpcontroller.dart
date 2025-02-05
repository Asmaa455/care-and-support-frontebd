import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';
import 'package:supcar/model/helpModel.dart';
import 'package:supcar/view/patient/help.dart';

class ShowhelpController extends GetxController {
  var helps = <HelpModel>[].obs;
}

class AcceptableController extends GetxController {
  var help = <HelpModel>[].obs;

  var isLoading = true.obs; // Observable loading state

  @override
  void onInit() {
    fetchAcceptableAid();
    super.onInit();
  }

  fetchAcceptableAid() async {
    String url = '$serverLink$acceptablePatientAid';
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

class UnacceptableController extends GetxController {
  var isLoading = true.obs; // Observable loading state

  var help = <HelpModel>[].obs;
  @override
  void onInit() {
    fetchUnacceptableAid();
    super.onInit();
  }

  fetchUnacceptableAid() async {
    String url = '$serverLink$unacceptablePatientAid';
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

  accepte(int id) async {
    var response = await ApiService().storeAccepteAis(id);

    if (response != null &&
        response['message'] == 'volunteer stored successfully') {
      Get.snackbar('69'.tr, '125'.tr, backgroundColor: pink);
    } else {
      print('Error: ${response['message']}');
    }
  }
}
