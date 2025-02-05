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
      body: RefreshIndicator(
        onRefresh: () async => controller.refresh(),
        child: Obx(
          () {
            if (controller.posts.isEmpty) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: controller.posts.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: lightPink),
                      borderRadius: BorderRadius.circular(10),
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
                              Text(
                                controller.posts[index].category,
                                textAlign: TextAlign.justify,
                                style: TextStyle(color: deepPurple),
                              ),
                            ],
                          ),
                        ),
                        firstName:
                            controller.posts[index].doctor!.user.firstName,
                        lastName:
                            controller.posts[index].doctor!.user.secondName,
                        time: DateTime.parse(controller.posts[index].createdAt
                            .toIso8601String()),
                        userImage: 'image/PI.jpeg'),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
