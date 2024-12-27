import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/controller/Addbloodprecontroller.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';

class Addsugarcontroller extends GetxController {
  var sliderValue = 0.0.obs;
  var status = false.obs;
  int patientaid = 1;
  int diseaseId = 2;
  var isLoading = true.obs;

  void updateSliderValue(double value) {
    sliderValue.value = value;
  }

  void updateStatus(bool value) {
    status.value = value;
  }

  void addValue() async {
    isLoading.value = true;

    String url = '$serverLink$addHealthyValueLink$patientaid/$diseaseId';
    print(url);
    var response =
        await ApiService().postRequest1(url, {'value': sliderValue.value});
    isLoading.value = false;

    if (response != null &&
        response['message'] == 'healthy value stored successfully') {
      Get.offNamed('sugar');
    } else {
      print('Error: ${response['message']}');
    }

    isLoading.value = false;
  }
}
