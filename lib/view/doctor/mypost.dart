import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/controller/Myconsultationcontroller.dart';
import 'package:supcar/controller/mypostcontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class Mypost extends StatelessWidget {
  Mypost({super.key});
  Mypostcontroller controller = Get.put(Mypostcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepPurple,
        title: Text(
          'My posts',
          style: TextStyle(color: lightPink, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        // decoration: BoxDecoration(
        //     border: Border.all(color: Colors.deepPurple),
        //     borderRadius: BorderRadius.circular(10)),
        child: Obx(() {
          if (controller.posts.isEmpty) {
            return Center(
              child: Text('loading'),
            );
          } else {
            return ListView.builder(
              itemCount: controller.posts.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: lightPink),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Post(
                          messege: Container(
                            margin: EdgeInsets.all(5),
                            child: Column(
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
                          ),
                          username: 'username',
                          time: DateTime.parse(controller.posts[index].createdAt
                              .toIso8601String()),
                          userImage: 'image/PI.jpeg',
                          leading: controller.posts[index].doctorId ==
                                  controller.doctorId
                              ? PopupMenuButton(
                                  itemBuilder: (context) => [
                                        PopupMenuItem(
                                            child: TextButton(
                                          child: Text('delete'),
                                          onPressed: () {},
                                        )),
                                        PopupMenuItem(child: Container())
                                      ])
                              : Container()),
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
