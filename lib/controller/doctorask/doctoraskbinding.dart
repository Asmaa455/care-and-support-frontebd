import 'package:get/get.dart';
import 'package:supcar/controller/doctorask/Doctoraskcontroller.dart';

class Doctoraskbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DoctoraskController());
  }
}
