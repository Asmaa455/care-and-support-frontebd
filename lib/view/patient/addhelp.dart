import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/content/valid.dart';
import 'package:supcar/controller/addhelpcontroller.dart';
import 'package:supcar/controller/addpostcontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class Addhelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AddhelpController controller = Get.put(AddhelpController());

    return Scaffold(
      appBar: AppBar(
        title: Icon(
          Icons.post_add,
          color: lightPink,
        ),
        centerTitle: true,
        backgroundColor: deepPurple,
      ),
      body: Container(
        child: ListView(
          children: [
            Form(
              key: controller.formstate1,
              child: Column(
                children: [
                  Form1(
                    focusNode: controller.typeHelpFocusNode,
                    hint1: ' Aid`s type',
                    mycontroller: controller.typeHelpController,
                    valid: (val) {
                      return Valid().vaidInput(val!, 0, 200);
                    },
                    max: 3,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 5),
                        child: Text(
                          ' Date',
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
                                    : 'Select Date'))),
                      ),
                    ],
                  ),
                  Form1(
                    focusNode: controller.locationFocusNode,
                    hint1: ' Location',
                    mycontroller: controller.locationController,
                    valid: (val) {
                      return Valid().vaidInput(val!, 3, 1000);
                    },
                    max: 1,
                  ),
                  Form1(
                    focusNode: controller.detailsFocusNode,
                    hint1: 'Details',
                    mycontroller: controller.detailsController,
                    valid: (val) {
                      return Valid().vaidInput(val!, 0, 1000);
                    },
                    max: 1,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: deepPurple),
                      borderRadius: BorderRadius.circular(15),
                      color: pink,
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (controller.formstate1.currentState?.validate() ??
                            false) {
                          controller.createAid();
                        } else {
                          print('Form validation failed');
                        }
                      },
                      child: Text("request aid"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
