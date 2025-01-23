import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/controller/doctorask/Doctoraskcontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';
import 'package:supcar/main.dart';
import 'package:supcar/model/conModel.dart';

class Doctorask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed('ask');
            },
            child: Icon(Icons.add),
          ),
          appBar: AppBar(
            backgroundColor: lightPink,
            toolbarHeight: 0,
            bottom: TabBar(
                labelColor: deepPurple,
                labelStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                unselectedLabelStyle:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                indicatorColor: deepPurple,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    child: Text('5'.tr),
                  ),
                ]),
          ),
          body: Container(
            child: TabBarView(
              children: [
                ReplayDone(),
              ],
            ),
          ),
        ));
  }
}

class ReplayDone extends StatelessWidget {
  final ReplayDoneController controller = Get.put(ReplayDoneController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Obx(
          () {
            if (controller.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: controller.consultations.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  // var consultation = controller.consultations[index];
                  return Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(right: 10, left: 10, top: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: lightPink),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Post(
                            messege: Text(
                              controller.consultations[index].consultationText,
                              textAlign: TextAlign.right,
                            ),
                            firstName: controller
                                .consultations[index].patient.user.firstName,
                            lastName: controller
                                .consultations[index].patient.user.secondName,
                            time: DateTime.now(),
                            userImage: 'image/PI.jpeg'),
                        controller.consultations[index].status == 1
                            ? Column(
                                crossAxisAlignment:
                                    sharedPref.getString('lan') == 'en'
                                        ? CrossAxisAlignment.start
                                        : CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(
                                      MyFlutterApp.replyAll,
                                      color: deepPurple,
                                    ),
                                  ),
                                  Post(
                                      messege: Text(
                                        controller
                                            .consultations[index].answerText,
                                        textAlign: TextAlign.justify,
                                      ),
                                      firstName: controller.consultations[index]
                                          .doctor.user.firstName,
                                      lastName: controller.consultations[index]
                                          .doctor.user.secondName,
                                      time: DateTime.now(),
                                      userImage: 'image/PI.jpeg'),
                                ],
                              )
                            : Container(
                                alignment: Alignment.bottomRight,
                                child: Icon(
                                  MyFlutterApp.commentEmpty,
                                  color: deepPurple,
                                ))
                      ],
                    ),
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
