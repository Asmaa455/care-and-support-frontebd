import 'package:supcar/constent/messege.dart';

vaidInput(String val, int min, int max) {
  if (val.length > max) {
    return "$messegeInputMax $max";
  }
  if (val.isEmpty) {
    return "$messegeInputEmpty";
  }
  if (val.length < min) {
    return "$messegeInputMin $min";
  }
}
