import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';
import 'package:supcar/main.dart';
import 'package:supcar/model/medication_time.dart';
import 'package:supcar/model/medicineModel.dart';

class MedicineDetailController extends GetxController {
  var medication = <Medication>[].obs;
  var status = 0.obs;
  var isLoading = true.obs;
  String? medIdString = sharedPref.getString('med_id');
  var selectedDateString = sharedPref.getString('select_date');

  @override
  void onInit() {
    super.onInit();
    medicationwithId();
    print('id____________________$medIdString');
    print("Length onInit: ${medication.length}");
    print(selectedDateString); // طباعة طول المصفوفة
    print(getMedicationsForSelectedDate().length);
  }

  @override
  void onClose() async {
    await sharedPref.remove('med_id');
    await sharedPref.remove('select_date');

    String? medId = sharedPref.getString('med_id');
    String? selectDate = sharedPref.getString('select_date');

    print('med_id: $medId'); // يجب أن تكون null
    print('select_date: $selectDate'); // يجب أن تكون null

    if (medId == null && selectDate == null) {
      print('SharedPreferences values have been successfully removed.');
    } else {
      print('Failed to remove SharedPreferences values.');
    }

    super.onClose();
  }

  void setStatus(int val) {
    status.value = val;
  }

  Future<void> medicationwithId() async {
    try {
      isLoading(true);

      if (medIdString != null) {
        int medId = int.parse(medIdString!);

        var fetchedMedication = await ApiService().fetchReminderTimes(medId);

        medication.assignAll(fetchedMedication);
        print("Assigned medication length: ${medication.length}");
      } else {
        print("med_id is not found in SharedPreferences or is empty");
        throw Exception('med_id is not valid');
      }
    } catch (e) {
      print("Error fetching medication: $e");
      rethrow;
    } finally {
      isLoading(false);
      print("Length finally: ${medication.length}");
    }
  }

  Future<void> addStatus(int id) async {
    try {
      isLoading(true);
      String url = '$serverLink$medStatus$id';
      print(url);
      var response =
          await ApiService().postRequest1(url, {'status': status.value});

      if (response != null && response['message'] == 'successfully') {
        status.value = 0;
        Get.back();
        Get.snackbar('88'.tr, '87'.tr, backgroundColor: pink);
      } else {
        print('Error: ${response['message']}');
      }
    } finally {
      isLoading(false);
    }
  }

  List<Medication> getMedicationsForSelectedDate() {
    var selectedDateString = sharedPref.getString('select_date');
    DateTime? selectedDate;

    if (selectedDateString != null) {
      selectedDate = DateTime.parse(selectedDateString);
    }

    if (selectedDate != null) {
      return medication.isNotEmpty
          ? medication.where((medTime) {
              DateTime medDateOnly = DateTime(
                  medTime.date.year, medTime.date.month, medTime.date.day);
              return isSameDay(medDateOnly, selectedDate!);
            }).toList()
          : [];
    } else {
      return [];
    }
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  // List<Medication> filterMedicationByDate(DateTime date) {
  //   DateTime dateOnly = DateTime(date.year, date.month, date.day);
  //   return medication.isNotEmpty
  //       ? medication.where((medTime) {
  //           DateTime medDateOnly = DateTime(
  //               medTime.date.year, medTime.date.month, medTime.date.day);
  //           return medDateOnly == dateOnly;
  //         }).toList()
  //       : [];
  // }

  // List<Medication> get filteredmed {
  //   var selectedDateString = sharedPref.getString('select_date');
  //   DateTime? selectedDate;

  //   if (selectedDateString != null) {
  //     selectedDate = DateTime.parse(selectedDateString);
  //   }

  //   if (selectedDate != null) {
  //     // استخراج التاريخ فقط بدون التوقيت
  //     DateTime selectedDateOnly =
  //         DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
  //     print("Selected date: $selectedDateOnly"); // طباعة التاريخ المختار

  //     // طباعة جميع العناصر الموجودة في med
  //     for (var value in medication) {
  //       print(
  //           "Medication ID: ${value.id}, Date: ${value.date}, Status: ${value.status}");
  //     }

  //     return medication.where((value) {
  //       // استخراج التاريخ فقط بدون التوقيت لكل عنصر في القائمة
  //       DateTime valueDateOnly =
  //           DateTime(value.date.year, value.date.month, value.date.day);
  //       print("Checking date: $valueDateOnly"); // طباعة كل تاريخ يتم التحقق منه

  //       bool isSameDay = valueDateOnly == selectedDateOnly;
  //       print("Is same day: $isSameDay"); // طباعة نتيجة التحقق لكل تاريخ
  //       return isSameDay;
  //     }).toList();
  //   } else {
  //     return [];
  //   }
  // }

  // List<Medication> get filterMedicinesByDate {
  //   var selectedDateString = sharedPref.getString('select_date');
  //   if (selectedDateString != null && medication.isNotEmpty) {
  //     var selectedDate = DateTime.parse(selectedDateString);
  //     return filterMedicationByDate(selectedDate);
  //   } else {
  //     if (selectedDateString == null) {
  //       print("selectedDateString is null");
  //     } else {
  //       print("Medication list is empty");
  //     }
  //     return [];
  //   }
  // }
}
