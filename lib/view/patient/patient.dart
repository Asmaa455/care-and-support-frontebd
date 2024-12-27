import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/controller/patientcontroller.dart';
import 'package:supcar/main.dart';

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
                margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: deepPurple),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Post(
                    messege: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                    ),
                    firstName: 'Doctor',
                    lastName: '',
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
