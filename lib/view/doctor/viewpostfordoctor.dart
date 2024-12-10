import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/controller/viewpostfordoctorcontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class Viewpostfordoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ViewPostForDoctorController controller =
        Get.put(ViewPostForDoctorController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: lightPink,
        onPressed: () {
          Navigator.of(context).pushNamed('addpost');
        },
        child: Icon(Icons.add),
      ),
      body: Obx(
        () {
          if (controller.posts.isEmpty) {
            return Center(
              child: Text('loading'),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.posts.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                // var consultation = controller.consultations[index];
                return Container(
                  margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: deepPurple),
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Column(
                      children: [
                        Post(
                            messege: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  controller.posts[index].title,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  controller.posts[index].content,
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                            username: 'Patient',
                            time: DateTime.parse(controller
                                .posts[index].createdAt
                                .toIso8601String()),
                            userImage: 'image/PI.jpeg'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
