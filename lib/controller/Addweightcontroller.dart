import 'package:get/get.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';

class Addweightcontroller extends GetxController {
  var sliderValue = 0.0.obs;
  var status = false.obs;
  int patientaid = 1;
  int diseaseId = 4;
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
    var response = await ApiService()
        .postRequest1(url, {'value': sliderValue.value.round()});
    isLoading.value = false;

    if (response != null &&
        response['message'] == 'healthy value stored successfully') {
      Get.back();
    } else {
      print('Error: ${response['message']}');
    }

    isLoading.value = false;
  }
}
