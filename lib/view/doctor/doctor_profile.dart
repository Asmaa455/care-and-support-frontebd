import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/custome_profile.dart';
import 'package:supcar/controller/doctor_profile_controller.dart';

class DoctorProfile extends StatelessWidget {
  DoctorProfile({super.key});
  DoctorProfileController controller = Get.put(DoctorProfileController());

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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              IconButton(
                  onPressed: () {
                    Get.toNamed('uodateprofiledoctor');
                  },
                  icon: Icon(Icons.edit)),
              CustomeProfile(
                image: '',
                fristName: controller.doctorData.value.user.firstName,
                secondName: controller.doctorData.value.user.secondName,
                speciality: Row(
                  children: [
                    Text(
                      '${'127'.tr}: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: deepPurple, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      controller.doctorData.value.specialization,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                contactInformation: Row(
                  children: [
                    Text(
                      '${'128'.tr}: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: deepPurple, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      controller.doctorData.value.contactInformation.toString(),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                clinicLocation: Row(
                  children: [
                    Text(
                      '${'129'.tr}: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: deepPurple, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      controller.doctorData.value.clinicLocation,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
