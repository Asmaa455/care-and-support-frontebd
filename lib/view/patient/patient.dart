import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/controller/patientcontroller.dart';

class Homepatient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomePatientController controller = Get.put(HomePatientController());

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Obx(
          () => ListView.builder(
            itemCount: controller.posts.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(bottom: 10, right: 10, left: 10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: lightPink),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Post(
                    messege: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          controller.posts[index].title,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          controller.posts[index].content,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                    username: 'Patient',
                    time: DateTime.parse(
                        controller.posts[index].createdAt.toIso8601String()),
                    userImage: 'image/PI.jpeg'),
              );
            },
          ),
        ),
      ),
    );
  }
}
