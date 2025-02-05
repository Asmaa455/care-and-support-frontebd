import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/controller/addmentalcontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class AddMentalHealth extends StatelessWidget {
  AddMentalHealth({super.key});
  Addmentalcontroller controller = Get.put(Addmentalcontroller());
  final PageController _controllerPage = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(
          MyFlutterApp.nounMentalHealth,
          color: lightPink,
          weight: 2,
          size: 50,
        ),
        backgroundColor: deepPurple,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controllerPage,
              itemCount: controller.questions.length + 1,
              itemBuilder: (context, index) {
                return controller.questions.length != index
                    ? Column(
                        children: [
                          Container(
                            color: lightGreen,
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: Text(
                              controller.questions[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          Expanded(
                            child: Obx(() => RadioListTile<String>(
                                  title: Text('7'.tr),
                                  value: 'Option 1',
                                  groupValue: controller.selectedAnswers[index],
                                  onChanged: (value) {
                                    controller.updateValue(value!, index, 0);
                                  },
                                )),
                          ),
                          Expanded(
                            child: Obx(() => RadioListTile<String>(
                                  title: Text('8'.tr),
                                  value: 'Option 2',
                                  groupValue: controller.selectedAnswers[index],
                                  onChanged: (value) {
                                    controller.updateValue(value!, index, 1);
                                  },
                                )),
                          ),
                          Expanded(
                            child: Obx(() => RadioListTile<String>(
                                  title: Text('9'.tr),
                                  value: 'Option 3',
                                  groupValue: controller.selectedAnswers[index],
                                  onChanged: (value) {
                                    controller.updateValue(value!, index, 2);
                                  },
                                )),
                          ),
                          Expanded(
                            child: Obx(() => RadioListTile<String>(
                                  title: Text('10'.tr),
                                  value: 'Option 4',
                                  groupValue: controller.selectedAnswers[index],
                                  onChanged: (value) {
                                    controller.updateValue(value!, index, 3);
                                  },
                                )),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '${controller.status}',
                            style: TextStyle(
                                color: lightPink,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'do you want to keep the score',
                            style: TextStyle(
                                color: deepPurple,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: deepPurple),
                                borderRadius: BorderRadius.circular(15),
                                color: pink),
                            child: TextButton(
                                onPressed: () {
                                  controller.addValue();
                                  Get.back();
                                },
                                child: Text(
                                  'add',
                                  style: TextStyle(
                                      color: lightPink,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                          )
                        ],
                      );
              },
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 50,
            color: lightGreen,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightGreen)),
                  onPressed: () {
                    _controllerPage.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  child: Text(
                    '11'.tr,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                ),
                SmoothPageIndicator(
                  controller: _controllerPage,
                  count: controller.questions.length,
                  effect: WormEffect(
                    dotWidth: 5.0,
                    dotHeight: 5.0,
                    spacing: 5.0,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.green,
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightGreen)),
                  onPressed: () {
                    if (controller
                            .selectedAnswers[_controllerPage.page!.round()] !=
                        '') {
                      _controllerPage.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    } else {
                      Get.snackbar('Error',
                          'Please answer the current question before proceeding.');
                    }
                  },
                  child: Text(
                    '12'.tr,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Obx(() => Text(
                'Total Score: ${controller.calculateTotalScore()}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              )),
        ],
      ),
    );
  }
}
