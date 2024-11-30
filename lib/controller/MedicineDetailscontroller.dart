import 'package:get/get.dart';
import 'package:supcar/model/medicineModel.dart';

class MedicineDetailsController extends GetxController {
  var table = <DateTime, bool>{}.obs;

  @override
  void onInit() {
    update();
    super.onInit();
  }

  Map<DateTime, bool> tableOfTime(Medicinemodel med) {
    if (med == null) {
      return {}; // إرجاع خريطة فارغة إذا كانت `med` تساوي null
    }

    Map<DateTime, bool> tableTimeMed = {}; // تخصيص قيمة ابتدائية للخريطة

    for (int i = 0; i < med.dailyRepetition; i++) {
      int timedu =
          (24 / med.dailyRepetition).toInt(); // استخدام toInt بدلاً من as
      Duration durationTime =
          Duration(hours: timedu * i); // ضرب المدة في عدد التكرارات
      DateTime timeNew = DateTime.parse(med.startDate)
          .add(durationTime); // استخدام add بدلاً من subtract
      tableTimeMed[timeNew] = false;
    }

    return tableTimeMed;
  }

  void updateTable(Medicinemodel med) {
    table.value = tableOfTime(
        med); // تحديث قيمة الـ `table` باستخدام الدالة `tableOfTime`
  }
}
