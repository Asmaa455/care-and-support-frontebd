import 'dart:convert';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';
import 'package:supcar/main.dart';
import 'package:supcar/model/medication_time.dart';
import 'package:supcar/model/medicineModel.dart';

class MedicineDetailController extends GetxController {
  Medicinemodel? medication;
  var medicationString;
  var status = 0.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    medicationString = sharedPref.getString('medicine_time');
    medication = getMedicationSync();
  }

  setStatus(int val) {
    status.value = val;
  }

  void addStatus(int id) async {
    isLoading.value = true;

    String url = '$serverLink$medStatus$id';
    print(url);
    var response =
        await ApiService().postRequest1(url, {'status': status.value});
    isLoading.value = false;

    if (response != null && response['message'] == 'successfully') {
      status.value = 0;
      print('${status.value}');
      Get.back();
      Get.snackbar('88'.tr, '87'.tr, backgroundColor: pink);
    } else {
      print('Error: ${response['message']}');
    }

    isLoading.value = false;
  }

  Medicinemodel? getMedicationSync() {
    if (medicationString != null) {
      var medicationJson = jsonDecode(medicationString) as Map<String, dynamic>;
      return Medicinemodel.fromJson(medicationJson);
    } else {
      return null;
    }
  }

  List<Medication> get filterMedicinesByDate {
    var selectedDateString = sharedPref.getString('select_date');
    if (selectedDateString != null && medication != null) {
      var selectedDate = DateTime.parse(selectedDateString);
      return medication!.medicationTime
          .where((medTime) =>
              medTime.date.day == selectedDate.day &&
              medTime.date.month == selectedDate.month &&
              medTime.date.year == selectedDate.year)
          .toList();
    } else {
      return [];
    }
  }
}
