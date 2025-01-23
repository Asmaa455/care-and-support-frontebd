import 'dart:convert';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:supcar/main.dart';
import 'package:supcar/model/medication_time.dart';
import 'package:supcar/model/medicineModel.dart';

class MedicineDetailController extends GetxController {
  Medicinemodel? medication;
  var medicationString;

  @override
  void onInit() {
    super.onInit();
    medicationString = sharedPref.getString('medicine_time');
    medication = getMedicationSync();
    print(medicationString);
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
