import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/controller/Addbloodprecontroller.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';

class Addsugarcontroller extends GetxController {
  var sliderValue = 0.0.obs;
  var status = false.obs;
  int diseaseId = 2;
  var isLoading = true.obs;
  String level = 'normal';

  void updateSliderValue(double value) {
    sliderValue.value = value;
  }

  void updateStatus(bool value) {
    status.value = value;
  }

  void addValue() async {
    isLoading.value = true;

    String url = '$serverLink$addHealthyValueLink$diseaseId';
    print(url);
    var response = await ApiService().postRequest1(url,
        {'value': sliderValue.value.round(), 'valuee': 0, 'status': level});
    isLoading.value = false;

    if (response != null &&
        response['message'] == 'healthy value stored successfully') {
      Get.back();
      Get.snackbar('90'.tr, '87'.tr, backgroundColor: pink);
    } else {
      print('Error: ${response['message']}');
    }

    isLoading.value = false;
  }
}
