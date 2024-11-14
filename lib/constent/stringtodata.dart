import 'package:intl/intl.dart';

String dateString = "10/01/2023 12:00 PM"; // Custom format
DateFormat format = DateFormat("MM/dd/yyyy hh:mm a");
DateTime dateTime = format.parse(dateString);
