import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';

class Addbloodprecontroller extends GetxController {
  var currentValue = 120.0.obs;
  var currentValue2 = 90.0.obs;
  int diseaseId = 1;
  var isLoading = true.obs;
  String status = '';
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

  String checkStatus(int systolic, int diastolic) {
    if (systolic < 120 && diastolic < 80) {
      return 'Normal';
    } else if (120 <= systolic && systolic < 130 && diastolic < 80) {
      return 'Elevated';
    } else if (130 <= systolic && systolic < 140 ||
        80 <= diastolic && diastolic < 90) {
      return 'High blood pressure (Hypertension Stage 1)';
    } else if (systolic >= 140 || diastolic >= 90) {
      return 'High blood pressure (Hypertension Stage 2)';
    } else {
      return 'Consult your doctor';
    }
  }

  void addValue() async {
    isLoading.value = true;
    status =
        checkStatus(currentValue.value.round(), currentValue2.value.round());
    String url = '$serverLink$addHealthyValueLink$diseaseId';
    print(url);
    var response = await ApiService().postRequest1(url, {
      'value': currentValue.value,
      'valuee': currentValue2.value,
      'status': status
    });
    print('status: $status');
    isLoading.value = false;

    if (response != null &&
        response['message'] == 'healthy value stored successfully') {
      Get.back();
      Get.snackbar('86'.tr, '87'.tr, backgroundColor: pink);
    } else {
      print('Error: ${response['message']}');
    }

    isLoading.value = false;
  }
}
