import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/convert_time.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/content/valid.dart';
import 'package:supcar/controller/addmedicinecontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class Addmedicine extends StatelessWidget {
  final AddMedicineController controller = Get.put(AddMedicineController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(
          MyFlutterApp.pills,
          color: lightPink,
        ),
        backgroundColor: deepPurple,
        centerTitle: true,
      ),
      body: Form(
        key: controller.formstate1,
        child: ListView(scrollDirection: Axis.vertical, children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 5, right: 20),
            child: Text(
              '77'.tr,
              style: TextStyle(
                  color: deepPurple, fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          Form1(
              // key: controller.formstate.value,
              hint1: '77'.tr,
              mycontroller: controller.medicineName,
              valid: (val) {
                return Valid().vaidInput(val!, 5, 20);
              },
              max: 1),
          Container(
            padding: EdgeInsets.only(left: 20, top: 5, right: 20),
            child: Text(
              '78'.tr,
              style: TextStyle(
                  color: deepPurple, fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          Form1(
              // key: controller.formstate.value,
              hint1: '78'.tr,
              mycontroller: controller.dosageAmount,
              valid: (val) {
                return Valid().vaidInput(val!, 0, 20);
              },
              max: 1),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, top: 5, right: 20),
                  child: Text(
                    '79'.tr,
                    style: TextStyle(
                        color: deepPurple,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(padding: EdgeInsets.all(20)),
                Obx(
                  () => DropdownButton<String>(
                    items: controller.daliyrepetion
                        .map((e) => DropdownMenuItem<String>(
                              child: Text('$e'),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      controller.amount.value = val;
                    },
                    value: controller.amount.value,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 5, right: 20),
                child: Text(
                  '80'.tr,
                  style: TextStyle(
                      color: deepPurple,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(padding: EdgeInsets.all(20)),
              Icon(MyFlutterApp.clock),
              Padding(padding: EdgeInsets.all(20)),
              Container(
                decoration: BoxDecoration(
                    color: pink,
                    border: Border.all(color: deepPurple),
                    borderRadius: BorderRadius.circular(15)),
                child: TextButton(
                    onPressed: () {
                      controller.selectedTime(context);
                    },
                    child: Obx(() => Text(controller.clickedTime.value
                        ? '${convertTime(controller.time.value.hour.toString())}:${convertTime(controller.time.value.minute.toString())}'
                        : '81'.tr))),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 5, right: 20),
                child: Text(
                  '82'.tr,
                  style: TextStyle(
                      color: deepPurple,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(padding: EdgeInsets.all(20)),
              Icon(MyFlutterApp.calendar),
              Padding(padding: EdgeInsets.all(20)),
              Container(
                decoration: BoxDecoration(
                    color: pink,
                    border: Border.all(color: deepPurple),
                    borderRadius: BorderRadius.circular(15)),
                child: TextButton(
                    onPressed: () {
                      controller.firstSelectDate(context);
                    },
                    child: Obx(() => Text(
                        controller.clickedDateFirst.value == true
                            ? '${controller.dateFirst.value.toString()}'
                            : '83'.tr))),
              ),
            ],
          ),
          Obx(
            () => Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, top: 5, right: 20),
                  child: Text(
                    '84'.tr,
                    style: TextStyle(
                        color: deepPurple,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                DropdownButton<String>(
                  items: controller.numbersDay
                      .map((e) => DropdownMenuItem<String>(
                            child: Text('$e'),
                            value: e.toString(),
                          ))
                      .toList(),
                  onChanged: (val) {
                    controller.number.value = val;
                  },
                  value: controller.number.value,
                ),
              ],
            ),
          ),
          Container(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: deepPurple, width: 2),
                borderRadius: BorderRadius.circular(15)),
            child: TextButton(
              onPressed: () {
                if (controller.formstate1.currentState?.validate() ?? false) {
                  controller.addMedicine();
                } else {
                  print('Form validation failed');
                }
              },
              child: Text("85".tr),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(pink),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
