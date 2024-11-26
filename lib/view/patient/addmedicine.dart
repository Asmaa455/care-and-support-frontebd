import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/constent/stringtodata.dart';
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
      body: Container(
        child: ListView(scrollDirection: Axis.vertical, children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 5),
            child: Text(
              'Medicine Name',
              style: TextStyle(
                  color: deepPurple, fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          Form1(
              // key: controller.formstate.value,
              hint1: 'Medicine Name',
              mycontroller: controller.medicineName,
              valid: (val) {
                return vaidInput(val!, 5, 20);
              },
              max: 1),
          Container(
            padding: EdgeInsets.only(left: 20, top: 5),
            child: Text(
              'Dosage amount',
              style: TextStyle(
                  color: deepPurple, fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          Form1(
              // key: controller.formstate.value,
              hint1: 'Dosage amount',
              mycontroller: controller.dosageAmount,
              valid: (val) {
                return vaidInput(val!, 5, 20);
              },
              max: 1),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, top: 5),
                  child: Text(
                    'Daily repetition',
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
                    items: ['1', '2', '3', '4']
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
                padding: EdgeInsets.only(left: 20, top: 5),
                child: Text(
                  'Starting Time',
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
                        : 'Select Time'))),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 5),
                child: Text(
                  'Starting Date',
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
                    child: Obx(() => Text(controller.clickedDateFirst.value
                        ? '${controller.dateFirst.value.toString()}'
                        : 'Select Date'))),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 5),
                child: Text(
                  'Ending Date',
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
                      controller.lastSelectDate(context);
                    },
                    child: Obx(() => Text(controller.clickedDateLast.value
                        ? '${controller.dateLast.value.toString()}'
                        : 'Select Date'))),
              ),
            ],
          ),
          Container(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: deepPurple, width: 2),
                borderRadius: BorderRadius.circular(15)),
            child: TextButton(
              onPressed: () {},
              child: Text("Add"),
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
