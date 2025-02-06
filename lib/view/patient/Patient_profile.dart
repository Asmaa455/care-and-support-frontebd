import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/custome_profile.dart';
import 'package:supcar/controller/patient_profile_controller.dart';

class PatientProfile extends StatelessWidget {
  PatientProfile({super.key});
  PatientProfileController controller = Get.put(PatientProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '151'.tr,
            style: TextStyle(color: lightPink, fontWeight: FontWeight.bold),
          ),
          backgroundColor: deepPurple,
          centerTitle: true,
        ),
        body: Obx(
          () => Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Get.toNamed('updatepatentprofile');
                    },
                    icon: Icon(Icons.edit)),
                CustomeProfile(
                  image: 'image/PI.jpeg',
                  fristName: controller.patientData.value.user.firstName,
                  secondName: controller.patientData.value.user.secondName,
                  speciality: Row(
                    children: [
                      Text(
                        '${'148'.tr}: ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: deepPurple, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${controller.patientData.value.age}',
                        textAlign: TextAlign.start,
                      ),
                      // Center(
                      //     child:
                      //         IconButton(onPressed: () {}, icon: Icon(Icons.edit)))
                    ],
                  ),
                  contactInformation: Row(
                    children: [
                      Text(
                        '${'149'.tr}: ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: deepPurple, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${controller.patientData.value.gender}',
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  clinicLocation: Row(
                    children: [
                      Text(
                        '${'150'.tr}: ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: deepPurple, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${controller.patientData.value.diseases}',
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
