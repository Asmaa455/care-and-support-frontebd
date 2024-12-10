import 'package:get/get.dart';
import 'package:supcar/constent/stringtodata.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';
import 'package:supcar/model/medicineModel.dart';

class MedicineController extends GetxController {
  var medicines = <Medicinemodel>[].obs;
  var isLoading = true.obs;
  int patientId = 1;
  var selectedDate = DateTime.now().obs;
  @override
  void onInit() {
    selectedDate;
    getTasksForSelectedDate();
    fetchMed();
    super.onInit();
  }

  // Observable loading state
  fetchMed() async {
    try {
      isLoading(true);
      var fetchedMedicines = await ApiService().fetchMedicine(patientId);
      print(fetchedMedicines);
      medicines.assignAll(fetchedMedicines);
    } finally {
      isLoading(false);
    }
  }

  List<Medicinemodel> getTasksForSelectedDate() {
    return medicines.where((med) {
      DateTime startDate = DateTime.parse(med.startDate);
      DateTime endDate =
          startDate.add(Duration(days: med.durationOfTakingTheDrug));
      return selectedDate.value
              .isAfter(startDate.subtract(Duration(days: 1))) &&
          selectedDate.value.isBefore(endDate.add(Duration(days: 1)));
    }).toList();
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
