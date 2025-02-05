import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/controller/Myconsultationcontroller.dart';
import 'package:supcar/controller/mypostcontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';
import 'package:supcar/main.dart';

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
        child: Obx(() {
          if (controller.posts.isEmpty) {
            return Center(
              child: Text('loading'),
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
                      firstName: ' ${sharedPref.getString('first_name')}',
                      lastName: ' ${sharedPref.getString('second_name')}',
                      time: DateTime.parse(
                          controller.posts[index].createdAt.toIso8601String()),
                      userImage: 'image/PI.jpeg'),
                );
              },
            );
          }
        }),
      ),
    );
  }
}
// leading: controller.posts[index].doctorId ==

                        //     ? PopupMenuButton(
                        //         itemBuilder: (context) => [
                        //               PopupMenuItem(
                        //                   child: TextButton(
                        //                 child: Text('delete'),
                        //                 onPressed: () {},
                        //               )),
                        //               PopupMenuItem(child: Container())
                        //             ])
                        //     : Container()