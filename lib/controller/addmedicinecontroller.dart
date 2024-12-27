import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/constent/stringtodata.dart';
import 'package:supcar/content/convert_time.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';
import 'package:intl/intl.dart';

class AddMedicineController extends GetxController {
  var isLoading = false.obs;
  GlobalKey<FormState> formstate1 = GlobalKey();
  TextEditingController medicineName = TextEditingController();
  TextEditingController dosageAmount = TextEditingController();
  var amount = Rx<String?>(null);
  var time = TimeOfDay(hour: 0, minute: 0).obs;
  var dateFirst = DateTime.now().obs;
  var dateLast = DateTime(2024, 12, 1).obs;
  var clickedTime = false.obs;
  var clickedDateFirst = false.obs;
  var clickedDateLast = false.obs;
  var daliyrepetion = ['1', '2', '3', '4'];
  List<String> numbersDay = List.generate(30, (index) => "${index + 1}").obs;
  var number = Rx<String?>(null);
  int patientId = 1;

  BuildContext? get context => null;

  @override
  void onInit() {
    super.onInit();
    addMedicine();
  }

  Future<TimeOfDay?> selectedTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: time.value);

    if (picked != null && picked != time.value) {
      time.value = picked;
      clickedTime.value = true;
    }

    return picked;
  }

  String getFormattedDate(DateTime dateTime) {
    // تنسيق التاريخ
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  Future<DateTime?> firstSelectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateFirst.value,
      firstDate: DateTime(1999),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != dateFirst.value) {
      dateFirst.value = picked;
      clickedDateFirst.value = true;
    }

    return picked;
  }

  Future<DateTime?> lastSelectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateLast.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != dateLast.value) {
      dateLast.value = picked;
      clickedDateLast.value = true;
    }

    return picked;
  }

  void addMedicine() async {
    isLoading.value = true;

    if (formstate1.currentState != null &&
        formstate1.currentState!.validate()) {
      String url = '$serverLink$addMedicineLink$patientId';
      var response = await ApiService().postRequest1(url, {
        'medication_name': medicineName.text,
        'amount': dosageAmount.text,
        'time_of_taking_the_drug': convertTimeOfDayToString(time.value),
        'daily_repetition': amount.value,
        'start_date': getFormattedDate(dateFirst.value),
        'duration_of_taking_the_drug': number.value,
      });
      isLoading.value = false;

      if (response != null &&
          response['message'] == 'Medication Time stored successfully') {
        Get.offNamed('medicine');
      } else {
        print('Error: ${response['message']}');
      }
    } else {
      isLoading.value = false;
      print('Form validation failed');
    }
  }
}
