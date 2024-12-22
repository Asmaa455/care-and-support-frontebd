import 'package:get/get.dart';

class Addmentalcontroller extends GetxController {
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
    return totalScore;
  }
}
