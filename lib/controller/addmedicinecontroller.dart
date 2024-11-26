import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMedicineController extends GetxController {
  var formstate = GlobalKey().obs;
  TextEditingController medicineName = TextEditingController();
  TextEditingController dosageAmount = TextEditingController();
  var amount = Rx<String?>(null);
  var time = TimeOfDay(hour: 0, minute: 0).obs;
  var dateFirst = DateTime(2024, 1, 1).obs;
  var dateLast = DateTime(2024, 12, 1).obs;
  var clickedTime = false.obs;
  var clickedDateFirst = false.obs;
  var clickedDateLast = false.obs;

  Future<TimeOfDay?> selectedTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: time.value);

    if (picked != null && picked != time.value) {
      time.value = picked;
      clickedTime.value = true;
    }

    return picked;
  }

  Future<DateTime?> firstSelectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateFirst.value,
      firstDate: DateTime.now(),
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
}
