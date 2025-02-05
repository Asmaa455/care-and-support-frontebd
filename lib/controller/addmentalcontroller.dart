import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';

class Addmentalcontroller extends GetxController {
  int patientaid = 1;
  int diseaseId = 3;
  var isLoading = true.obs;
  String status = '';
  @override
  void onInit() {
    status = '';
    score.value = 0;
    super.onInit();
  }

  List<String> values = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ];

  var score = 0.obs;
  var questionScores = List<int>.filled(20, 0, growable: false).obs;

  final List<String> questions = [
    '6'.tr,
    '13'.tr,
    '14'.tr,
    '15'.tr,
    '16'.tr,
    '17'.tr,
    '18'.tr,
    '19'.tr,
    '20'.tr,
    '21'.tr,
    '22'.tr,
    '23'.tr,
    '24'.tr,
    '25'.tr,
    '26'.tr,
    '27'.tr,
    '28'.tr,
    '29'.tr,
    '30'.tr,
    '31'.tr
  ];

  var selectedAnswers = List<String>.filled(20, '', growable: false).obs;

  void updateValue(String value, int questionIndex, int num) {
    if (selectedAnswers[questionIndex].isNotEmpty) {
      // إذا تم تغيير الاختيار، قم بتحديث الدرجة بناءً على القيمة الجديدة
      int previousScore = questionScores[questionIndex];
      score.value -= previousScore;
    }

    selectedAnswers[questionIndex] = value;
    questionScores[questionIndex] = num;
    score.value += num;

    print("Total Score: ${score.value}");
  }

  int calculateTotalScore() {
    int totalScore = 0;
    for (int score in questionScores) {
      totalScore += score;
    }
    _checkDepressionStatus(totalScore);
    return totalScore;
  }

  String _checkDepressionStatus(totalScore) {
    if (totalScore <= 10) {
      status = "اكتئاب قليل أو عدم وجود اكتئاب";
      return status;
    } else if (11 <= totalScore && totalScore <= 16) {
      status = "اكتئاب خفيف";
      return status;
    } else if (17 <= totalScore && totalScore <= 20) {
      status = "اكتئاب متوسط إلى شديد";
      return status;
    } else if (21 <= totalScore && totalScore <= 30) {
      status = "اكتئاب شديد";
      return status;
    } else {
      status = "اكتئاب شديد جداً";
      return status;
    }
  }

  void addValue() async {
    isLoading.value = true;

    String url = '$serverLink$addHealthyValueLink$diseaseId';
    print(url);
    var response = await ApiService()
        .postRequest1(url, {'value': score.value, 'status': status});
    isLoading.value = false;

    if (response != null &&
        response['message'] == 'healthy value stored successfully') {
      Get.snackbar('89'.tr, '87'.tr, backgroundColor: pink);
      Get.back();
    } else {
      print('Error: ${response['message']}');
    }

    isLoading.value = false;
  }
}
