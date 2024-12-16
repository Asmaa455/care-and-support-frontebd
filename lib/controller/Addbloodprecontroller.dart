import 'package:get/get.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';

class Addbloodprecontroller extends GetxController {
  var currentValue = 120.0.obs;
  var currentValue2 = 90.0.obs;
  int patientaid = 1;
  int diseaseId = 1;
  var isLoading = true.obs;

  void updateValue(double value) {
    currentValue.value = value;
  }

  void updateValue2(double value) {
    currentValue2.value = value;
  }

  var temperature = 50.0.obs;
  var humidity = 30.0.obs;
  var pressure = 1013.0.obs;
  void updateTemperature(double value) {
    temperature.value = value;
  }

  void updateHumidity(double value) {
    humidity.value = value;
  }

  void updatePressure(double value) {
    pressure.value = value;
  }

  void addValue() async {
    isLoading.value = true;

    String url = '$serverLink$addHealthyValueLink$patientaid/$diseaseId';
    print(url);
    var response =
        await ApiService().postRequest1(url, {'value': currentValue.value});
    isLoading.value = false;

    if (response != null &&
        response['message'] == 'healthy value stored successfully') {
      Get.offNamed('bloodpressure');
    } else {
      print('Error: ${response['message']}');
    }

    isLoading.value = false;
  }
}
