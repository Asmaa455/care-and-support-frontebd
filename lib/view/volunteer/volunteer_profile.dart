import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/custome_profile.dart';
import 'package:supcar/controller/volunteer_profile_controller.dart';

class VolunteerProfile extends StatelessWidget {
  VolunteerProfile({super.key});
  VolunteerProfileController controller = Get.put(VolunteerProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'My Profile',
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
                      Get.toNamed('editprofile');
                    },
                    icon: Icon(Icons.edit)),
                CustomeProfile(
                  image: 'image/PI.jpeg',
                  fristName: controller.volunteerData.value.user.firstName,
                  secondName: controller.volunteerData.value.user.secondName,
                  speciality: Row(
                    children: [
                      Text(
                        '${'130'.tr}: ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: lightPink, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${controller.volunteerData.value.nationalNumber}',
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
                        '${'128'.tr}: ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: lightPink, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${controller.volunteerData.value.contactInformation}',
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  clinicLocation: null,
                ),
              ],
            ),
          ),
        ));
  }
}
