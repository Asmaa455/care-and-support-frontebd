import 'package:get/get.dart';

class MedicineController extends GetxController {
  var medicines = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initial data example
    var initialMedicine = {
      'name': 'Name of Medicine',
      'description': 'description',
    };
    medicines.add(initialMedicine);
  }
}
