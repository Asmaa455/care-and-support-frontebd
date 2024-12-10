import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/constent/stringtodata.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/controller/helpcontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HelpController controller = Get.put(HelpController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help',
          style: TextStyle(color: lightPink, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: deepPurple,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('addhelp');
        },
        child: Icon(Icons.add),
        backgroundColor: lightPink,
      ),
      body: Container(
        child: Obx(() {
          if (controller.help.isEmpty) {
            return Center(
              child: Text('loading'),
            );
          } else {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: controller.help.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: lightPink),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Post(
                                messege: Card(
                                  color:
                                      const Color.fromARGB(255, 176, 211, 241),
                                  child: ListTile(
                                    leading:
                                        Icon(Icons.volunteer_activism_sharp),
                                    title: Text(
                                      ' ${controller.help[index].aidType}',
                                      textAlign: TextAlign.end,
                                    ),
                                    subtitle: Text(
                                      'المكان:${controller.help[index].location}\n التفاصيل: ${controller.help[index].additionalDetails}',
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                                username: 'username',
                                time: DateTime.now(),
                                userImage: 'image/PI.jpeg'),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: controller.help[index].status != 1
                              ? Icon(
                                  MyFlutterApp.commentEmpty,
                                  color: deepPurple,
                                )
                              : Icon(
                                  MyFlutterApp.comment,
                                  color: deepPurple,
                                ),
                        ),
                        controller.help[index].status == 1
                            ? Container(
                                margin: EdgeInsets.only(
                                    right: 10, left: 10, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Icon(
                                        MyFlutterApp.replyAll,
                                        color: lightPink,
                                      ),
                                    ),
                                    Post(
                                        messege: Text(
                                          controller
                                              .help[index].additionalDetails,
                                        ),
                                        username: 'volunteer',
                                        time: DateTime.now(),
                                        userImage: 'image/PI.jpeg'),
                                  ],
                                ),
                              )
                            : Container()
                      ],
                    ),
                  );
                });
          }
        }),
      ),
    );
  }
}
//  ListView(
//             scrollDirection: Axis.vertical,
//             children: [
//               Container(
//                 margin: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     border: Border.all(color: lightPink),
//                     borderRadius: BorderRadius.circular(15)),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Container(
//                       child: Post(
//                           messege: 'messege',
//                           username: 'username',
//                           time: DateTime.now(),
//                           userImage: 'image/PI.jpeg'),
//                     ),
//                     Container(
//                       height: 20,
//                     ),
//                     Container(
//                       margin: EdgeInsets.all(10),
//                       child: controller.status.value != true
//                           ? Icon(
//                               MyFlutterApp.comment_empty,
//                               color: deepPurple,
//                             )
//                           : Icon(
//                               MyFlutterApp.comment,
//                               color: deepPurple,
//                             ),
//                     ),
//                     controller.status.value == true
//                         ? Container(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.all(10),
//                                   child: Icon(
//                                     MyFlutterApp.reply,
//                                     color: lightPink,
//                                   ),
//                                 ),
//                                 Post(
//                                     messege: 'messege',
//                                     username: 'username',
//                                     time: DateTime.now(),
//                                     userImage: 'image/PI.jpeg'),
//                               ],
//                             ),
//                           )
//                         : Container()
//                   ],
//                 ),
//               ),
//             ],
//           ),