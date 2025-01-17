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
          '69'.tr,
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
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
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
                                  color: lightBlue,
                                  child: ListTile(
                                    leading:
                                        Icon(Icons.volunteer_activism_sharp),
                                    title: Text(
                                      ' ${controller.help[index].aidType}',
                                      textAlign: TextAlign.start,
                                    ),
                                    subtitle: Text(
                                      '70'.tr +
                                          ':${controller.help[index].location}\n' +
                                          '71'.tr +
                                          ': ${controller.help[index].additionalDetails}',
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                                firstName: controller
                                    .help[index].patient.user.firstName,
                                lastName: controller
                                    .help[index].patient.user.secondName,
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
                                : Container(
                                    margin: EdgeInsets.only(
                                        right: 10, left: 10, bottom: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(
                                            MyFlutterApp.replyAll,
                                            color: lightPink,
                                          ),
                                        ),
                                        Post(
                                            messege: Card(
                                              color: lightBlue,
                                              child: ListTile(
                                                leading: Icon(Icons
                                                    .volunteer_activism_sharp),
                                                title: Text(
                                                  '\n contact information: ${controller.help[index].volunteer?.contactInformation}',
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                            ),
                                            firstName: controller.help[index]
                                                .volunteer!.user.firstName,
                                            lastName: controller.help[index]
                                                .volunteer!.user.secondName,
                                            time: DateTime.now(),
                                            userImage: 'image/PI.jpeg'),
                                      ],
                                    ),
                                  ))
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
