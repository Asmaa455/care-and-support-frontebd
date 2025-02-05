import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/controller/Myconsultationcontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';
import 'package:supcar/main.dart';

class Myconsulation extends StatelessWidget {
  Myconsulation({super.key});
  Myconsultationcontroller controller = Get.put(Myconsultationcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepPurple,
        title: Text(
          '113'.tr,
          style: TextStyle(color: lightPink, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Obx(() {
          if (controller.consultations.isEmpty) {
            return Center(
              child: Text('loading'),
            );
          } else {
            return ListView.builder(
              itemCount: controller.consultations.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: lightPink),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Post(
                          messege: Text(
                            controller.consultations[index].consultationText,
                            textAlign: TextAlign.justify,
                          ),
                          firstName: controller
                              .consultations[index].patient.user.firstName,
                          lastName: controller
                              .consultations[index].patient.user.secondName,
                          time: DateTime.parse(
                              controller.consultations[index].createdAt),
                          userImage: 'image/PI.jpeg'),
                      Container(
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment:
                              sharedPref.getString('lang') == 'en'
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                          children: [
                            Icon(
                              MyFlutterApp.replyAll,
                              color: deepPurple,
                            ),
                            Post(
                                messege: Text(
                                  controller.consultations[index].answerText,
                                ),
                                firstName:
                                    ' ${sharedPref.getString('first_name')}',
                                lastName:
                                    ' ${sharedPref.getString('second_name')}',
                                time: DateTime.parse(
                                    controller.consultations[index].updatedAt),
                                userImage: 'image/PI.jpeg'),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}
