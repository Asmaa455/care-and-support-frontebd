import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/customecard.dart';
import 'package:supcar/content/grid.dart';
import 'package:supcar/controller/Measurecontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';
import 'package:animated_expandable_fab/animated_expandable_fab.dart';
import 'package:supcar/main.dart';

class Measure extends StatelessWidget {
  Measure({super.key});
  final Measurecontroller controller = Get.put(Measurecontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ExpandableFab(
        distance: 100,
        openIcon: Icon(Icons.add),
        closeIcon: Icon(Icons.close),
        children: [
          ActionButton(
            color: Colors.white,
            icon: Icon(
              MyFlutterApp.nounBloodPressure,
              color: Colors.red,
            ),
            onPressed: () {
              Get.toNamed('addbloodpre');
            },
          ),
          ActionButton(
            color: Colors.white,
            icon: Icon(
              MyFlutterApp.nounDiabetesTest,
              color: Colors.blue,
            ),
            onPressed: () {
              Get.toNamed('addsugar');
            },
          ),
          ActionButton(
            color: Colors.white,
            icon: Icon(MyFlutterApp.nounWeight, color: Colors.yellow),
            onPressed: () {
              Get.toNamed('addweight');
            },
          ),
          ActionButton(
            color: Colors.white,
            icon: Icon(MyFlutterApp.nounMentalHealth, color: Colors.green),
            onPressed: () {
              Get.toNamed('addmentalhealth');
            },
          ),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        // استخدام Column لتحتوي Expanded بشكل صحيح
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Column(children: [
              Row(
                children: [
                  CustomCard(
                    onTap: () {
                      Get.toNamed('bloodPressure');
                    },
                    cardColor: lightRed,
                    borderColor: deepPurple,
                    iconColor: Colors.red,
                    icon: MyFlutterApp.nounBloodPressure,
                    text: 'Blood Pressure',
                  ),
                  CustomCard(
                    onTap: () {
                      Get.toNamed('sugar');
                    },
                    cardColor: lightBlue,
                    borderColor: deepPurple,
                    iconColor: Colors.blue,
                    icon: MyFlutterApp.nounDiabetesTest,
                    text: 'Blood Sugar',
                  ),
                ],
              ),
              Row(
                children: [
                  CustomCard(
                    onTap: () {
                      Get.toNamed('mentalhealth');
                    },
                    cardColor: lightGreen,
                    borderColor: deepPurple,
                    iconColor: Colors.green,
                    icon: MyFlutterApp.nounMentalHealth,
                    text: 'Mental Health ',
                  ),
                  CustomCard(
                    onTap: () {
                      Get.toNamed('weight');
                    },
                    cardColor: lightYellow,
                    borderColor: deepPurple,
                    iconColor: Colors.yellow,
                    icon: MyFlutterApp.nounWeight,
                    text: 'Weight        ',
                  ),
                ],
              ),
              CalendarTimeline(
                initialDate: controller.selectedDate.value,
                firstDate: DateTime(2020, 1, 1),
                lastDate: DateTime(9999, 12, 31),
                onDateSelected: (date) {
                  controller.selectedDate.value = date;
                },
                leftMargin: 20,
                monthColor: Colors.blueGrey,
                dayColor: deepPurple,
                activeDayColor: Colors.white,
                activeBackgroundDayColor: lightPink,
                dotColor: Color(0xFF333A47),
                selectableDayPredicate: (date) => date.day != 0,
                locale: sharedPref.getString('lang') == 'en' ? 'en' : 'ar',
              ),
            ]),
          ),
          Obx(() => CustomGrid(
                controller: controller,
                color: lightRed,
                borderColor: deepPurple,
                iconColor: Colors.red,
                itemCount: controller.filteredPressure.length,
                icon: MyFlutterApp.nounBloodPressure,
                pressure: controller.filteredPressure,
              )),
          Obx(() => CustomGrid(
              controller: controller,
              color: lightBlue,
              borderColor: deepPurple,
              iconColor: Colors.blue,
              itemCount: controller.filteredSugar.length,
              icon: MyFlutterApp.nounDiabetesTest,
              pressure: controller.filteredSugar)),
          Obx(() => CustomGrid(
              controller: controller,
              color: lightYellow,
              borderColor: deepPurple,
              iconColor: Colors.yellow,
              itemCount: controller.filteredWeight.length,
              icon: MyFlutterApp.nounDiabetesTest,
              pressure: controller.filteredWeight)),
          Obx(() => CustomGrid(
              controller: controller,
              color: lightGreen,
              borderColor: deepPurple,
              iconColor: Colors.green,
              itemCount: controller.filteredMentalHealth.length,
              icon: MyFlutterApp.nounDiabetesTest,
              pressure: controller.filteredMentalHealth)),
        ],
      ),
    );
  }
}
