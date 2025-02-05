// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/controller/showhelpcontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class Showhelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: lightPink,
            toolbarHeight: 0,
            bottom: TabBar(
                labelColor: deepPurple,
                labelPadding: EdgeInsets.all(10),
                labelStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                unselectedLabelStyle:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                indicatorColor: deepPurple,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Text(
                    '123'.tr,
                  ),
                  Text('124'.tr)
                ]),
          ),
          body: TabBarView(children: [Acceptable(), Unacceptable()])),
    );
  }
}

class Acceptable extends StatelessWidget {
  Acceptable({super.key});
  AcceptableController controller = Get.put(AcceptableController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        // Debugging: Print the help list
        print('Helps List: ${controller.help.length}');

        // Fallback UI if the list is empty
        if (controller.help.isEmpty) {
          return Center(
            child: Text(
              'No data available',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: controller.help.length,
          itemBuilder: (context, index) {
            // Debugging: Print each item
            print('Help Item: ${controller.help[index]}');

            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: lightPink),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Post(
                    messege: Card(
                      color: pink,
                      child: ListTile(
                        title: Row(
                          children: [
                            Icon(
                              Icons.quiz_sharp,
                              color: lightPink,
                            ),
                            Text(
                              ' ${controller.help[index].aidType}',
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        subtitle: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: lightPink,
                                ),
                                Text(
                                  '${controller.help[index].location}',
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '71'.tr,
                                  style: TextStyle(
                                    color: lightPink,
                                    fontSize: 17,
                                  ),
                                ),
                                Text(
                                  ': ${controller.help[index].additionalDetails}',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    firstName: controller.help[index].patient.user.firstName,
                    lastName: controller.help[index].patient.user.secondName,
                    time: DateTime.now(),
                    userImage: 'image/PI.jpeg',
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}

class Unacceptable extends StatelessWidget {
  Unacceptable({super.key});
  UnacceptableController controller = Get.put(UnacceptableController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        // Debugging: Print the help list
        print('Helps List: ${controller.help}');

        // Fallback UI if the list is empty
        if (controller.help.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: controller.help.length,
          itemBuilder: (context, index) {
            // Debugging: Print each item
            print('Help Item: ${controller.help[index]}');

            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: lightPink),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Post(
                    messege: Card(
                      color: pink,
                      child: ListTile(
                        title: Row(
                          children: [
                            Icon(
                              Icons.quiz_sharp,
                              color: lightPink,
                            ),
                            Text(
                              ' ${controller.help[index].aidType}',
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        subtitle: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: lightPink,
                                ),
                                Text(
                                  '${controller.help[index].location}',
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '71'.tr,
                                  style: TextStyle(
                                    color: lightPink,
                                    fontSize: 17,
                                  ),
                                ),
                                Text(
                                  ': ${controller.help[index].additionalDetails}',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    firstName: controller.help[index].patient.user.firstName,
                    lastName: controller.help[index].patient.user.secondName,
                    time: DateTime.now(),
                    userImage: 'image/PI.jpeg',
                  ),
                  IconButton(
                    onPressed: () {
                      controller.accepte(controller.help[index].id);
                    },
                    icon: Icon(MyFlutterApp.commentEmpty),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
// Container(
//           child: ListView(
//             scrollDirection: Axis.vertical,
//             children: [
//               Container(
//                 margin: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: lightPink),
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Container(
//                       child: Post(
//                         messege: Text('messege'),
//                         firstName: 'username',
//                         lastName: '',
//                         time: DateTime.now(),
//                         userImage: 'image/PI.jpeg',
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         Get.toNamed('replayhelp');
//                       },
//                       icon: Icon(MyFlutterApp.comment),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
