import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';
import 'package:supcar/model/healthyValueModel.dart';

class Measurecontroller extends GetxController {
  var pressure = <Healthyvaluemodel>[].obs;
  var sugar = <Healthyvaluemodel>[].obs;
  var weight = <Healthyvaluemodel>[].obs;
  var mentalHealth = <Healthyvaluemodel>[].obs;

  int diseaseId = 1;
  var isLoading = true.obs;
  var selectedDate = DateTime.now().obs;

  @override
  void onInit() {
    fetchValueForPressure();
    fetchValueForSugar();
    fetchValueForWeight();
    fetchValueForMentalHealth();

    super.onInit();
  }

  fetchValueForPressure() async {
    int diseaseId = 1;
    try {
      isLoading(true);
      var fetchedvalue = await ApiService().fetchHeathlyValue(diseaseId);
      print(fetchedvalue);
      pressure.assignAll(fetchedvalue);
    } finally {
      print('object');
      isLoading(false);
    }
  }

  fetchValueForSugar() async {
    int diseaseId = 2;
    try {
      isLoading(true);
      var fetchedvalue = await ApiService().fetchHeathlyValue(diseaseId);
      print(fetchedvalue);
      sugar.assignAll(fetchedvalue);
    } finally {
      isLoading(false);
    }
  }

  fetchValueForWeight() async {
    int diseaseId = 4;
    try {
      isLoading(true);
      var fetchedvalue = await ApiService().fetchHeathlyValue(diseaseId);
      print(fetchedvalue);

      weight.assignAll(fetchedvalue);
    } finally {
      isLoading(false);
    }
  }

  fetchValueForMentalHealth() async {
    int diseaseId = 3;
    try {
      isLoading(true);
      var fetchedvalue = await ApiService().fetchHeathlyValue(diseaseId);
      print(fetchedvalue);
      mentalHealth.assignAll(fetchedvalue);
    } finally {
      isLoading(false);
    }
  }

  List<Healthyvaluemodel> get filteredPressure {
    return pressure.where((value) {
      return value.createAt.day == selectedDate.value.day &&
          value.createAt.month == selectedDate.value.month &&
          value.createAt.year == selectedDate.value.year;
    }).toList();
  }

  List<Healthyvaluemodel> get filteredSugar {
    return sugar.where((value) {
      return value.createAt.day == selectedDate.value.day &&
          value.createAt.month == selectedDate.value.month &&
          value.createAt.year == selectedDate.value.year;
    }).toList();
  }

  List<Healthyvaluemodel> get filteredWeight {
    return weight.where((value) {
      return value.createAt.day == selectedDate.value.day &&
          value.createAt.month == selectedDate.value.month &&
          value.createAt.year == selectedDate.value.year;
    }).toList();
  }

  List<Healthyvaluemodel> get filteredMentalHealth {
    return mentalHealth.where((value) {
      return value.createAt.day == selectedDate.value.day &&
          value.createAt.month == selectedDate.value.month &&
          value.createAt.year == selectedDate.value.year;
    }).toList();
  }

  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
  }
}
