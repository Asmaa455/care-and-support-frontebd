import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

String dateString = "10/01/2023 12:00 PM"; // Custom format
DateFormat format = DateFormat("MM/dd/yyyy hh:mm a");
DateTime dateTime = format.parse(dateString);

String convertTimeOfDayToString(TimeOfDay time) {
  final hours = time.hour.toString().padLeft(2, '0');
  final minutes = time.minute.toString().padLeft(2, '0');
  return '$hours:$minutes:00';
}
