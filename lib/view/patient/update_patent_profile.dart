import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/content/profileimage.dart';
import 'package:supcar/content/valid.dart';
import 'package:supcar/controller/patient_profile_controller.dart';

class UpdatePatentProfile extends StatelessWidget {
  UpdatePatentProfile({super.key});
  PatientProfileController controller = Get.put(PatientProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '135'.tr,
          style: TextStyle(color: lightPink, fontWeight: FontWeight.bold),
        ),
        backgroundColor: deepPurple,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Form(
            key: controller.formstate1,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileImage(onEdit: () {}),
                  Form1(
                      lebal: '131'.tr,
                      mycontroller: controller.firstNamecontroller,
                      valid: (p0) {
                        return Valid().vaidInput(p0!, 0, 20);
                      },
                      max: 1),
                  Form1(
                      lebal: '132'.tr,
                      mycontroller: controller.secondNamecontroller,
                      valid: (p0) {
                        return Valid().vaidInput(p0!, 0, 20);
                      },
                      max: 1),
                  Form1(
                      lebal: '148'.tr,
                      mycontroller: controller.agecontroller,
                      valid: (p0) {
                        return Valid().vaidInput(p0!, 0, 20);
                      },
                      max: 1),
                  Form1(
                      lebal: '149'.tr,
                      mycontroller: controller.gendercontroller,
                      valid: (p0) {
                        return Valid().vaidInput(p0!, 0, 20);
                      },
                      max: 1),
                  Form1(
                      lebal: '150'.tr,
                      mycontroller: controller.diseasescontroller,
                      valid: (p0) {
                        return Valid().vaidInput(p0!, 0, 20);
                      },
                      max: 1),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        color: pink,
                        border: Border.all(color: deepPurple),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      onPressed: () {
                        if (controller.formstate1.currentState?.validate() ??
                            false) {
                          controller.updatepatientData();
                        } else {
                          print('Form validation failed');
                        }
                      },
                      child: Text('133'.tr),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
