import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/content/profileimage.dart';
import 'package:supcar/content/valid.dart';
import 'package:supcar/controller/volunteer_profile_controller.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  VolunteerProfileController controller = Get.put(VolunteerProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
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
                  lebal: '128'.tr,
                  mycontroller: controller.contactInformationcontroller,
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
                      controller.updateVolunteerData();
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
    );
  }
}
