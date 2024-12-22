import 'package:intl/intl.dart';

String convertTime(String minutes) {
  if (minutes.length == 1) {
    return "0$minutes";
  } else {
    return minutes;
  }
}

String getFormattedDate(DateTime dateTime) {
  // تنسيق التاريخ
  return DateFormat('yyyy-MM-dd').format(dateTime);
}
