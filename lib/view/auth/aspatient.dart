import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/content/profileimage.dart';
import 'package:supcar/content/valid.dart';
import 'package:supcar/controller/aspatientcontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class AsPatient extends StatelessWidget {
  AsPatient({super.key});
  Aspatientcontroller controller = Get.put(Aspatientcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Form(
              key: controller.formstate1,
              child: Container(
                // decoration: BoxDecoration(
                //   border: Border.all(),
                // ),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      height: 20,
                    ),
                    Center(
                      child: ProfileImage(
                        profileImage: controller.profileImage.value != null
                            ? Image.file(
                                File(controller.profileImage.value!.path))
                            : null,
                        onEdit: controller.selectProfileImage,
                      ),
                    ),
                    Form1(
                        hint1: 'Age',
                        mycontroller: controller.age,
                        valid: (p0) {
                          return Valid().vaidInput(p0!, 1, 10);
                        },
                        max: 1),
                    Container(
                      margin: EdgeInsets.all(4),
                      padding: EdgeInsets.only(right: 4, left: 4),
                      decoration: BoxDecoration(
                        color: pink,
                        border: Border.all(color: deepPurple),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: DropdownButton<String>(
                              value: controller.selectedGender.value.isEmpty
                                  ? null
                                  : controller.selectedGender.value,
                              hint: Text('Select Gender'),
                              items: ['Male', 'Female'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                controller.setSelectedGender(newValue!);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(4),
                      padding: EdgeInsets.only(right: 4, left: 4),
                      decoration: BoxDecoration(
                        color: pink,
                        border: Border.all(color: deepPurple),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: DropdownButton<String>(
                              value: controller.selectedDisease.value.isEmpty
                                  ? null
                                  : controller.selectedDisease.value,
                              hint: Text('Select disease'),
                              items: [
                                'Diabetes',
                                'Pressure',
                                'Obesity',
                                'Depression',
                                'Cancer'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                controller.setSelectedDisease(newValue!);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    controller.selectedDisease.value == 'Cancer'
                        ? Container(
                            height: 50,
                            margin: EdgeInsets.all(4),
                            padding: EdgeInsets.only(right: 4, left: 4),
                            decoration: BoxDecoration(
                                color: pink,
                                border: Border.all(color: deepPurple),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Paper to prove cancer '),
                                InkWell(
                                  onTap: () =>
                                      controller.selectpaperToProveCancer(),
                                  child: Container(
                                    height: 40,
                                    // margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(5),

                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Row(
                                      children: [
                                        Icon((Icons.add_a_photo_outlined)),
                                        controller.paperToProveCancer.value ==
                                                null
                                            ? Text('add photo')
                                            : Text('change photo'),
                                      ],
                                    ),
                                  ),
                                ),
                                controller.paperToProveCancer.value == null
                                    ? Container()
                                    : Container(
                                        height: 40,
                                        padding: EdgeInsets.only(
                                            right: 10, left: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.check_circle_rounded,
                                              color: Colors.green,
                                            ),
                                            Text('98'.tr),
                                          ],
                                        ),
                                      )
                              ],
                            ),
                          )
                        : Container(),
                    TextButton(
                        onPressed: () {
                          if (controller.formstate1.currentState?.validate() ??
                              false) {
                            controller.createPateitAcount();
                            print('Form validation successful');
                          } else {
                            print('Form validation failed');
                          }
                        },
                        child: Text('Sign Up')),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
