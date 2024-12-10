import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/controller/consultationcontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class Consultation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: lightPink,
            toolbarHeight: 0,
            bottom: TabBar(
                labelStyle:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                unselectedLabelStyle:
                    TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
                indicatorColor: deepPurple,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    child: Text('Answered'),
                  ),
                  Tab(
                    child: Text('Not yet answered'),
                  )
                ]),
          ),
          body: TabBarView(children: [Answered(), NotReplay1()])),
    );
  }
}

class NotReplay1 extends StatelessWidget {
  final NotReplayController controller = Get.put(NotReplayController());

  void showDialogConsulation(int patientId) {
    Get.dialog(
      AlertDialog(
        title: Text("Reply to the consultation"),
        content: Form(
          key: controller.formstate1,
          child: TextFormField(
            controller: controller.replay,
            decoration: InputDecoration(hintText: "Write"),
            maxLines: 10,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Please enter a reply';
              }
              return null;
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => controller.addAnswered(patientId),
            child: Text('Add Reply'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Obx(
          () {
            if (controller.consultations.isEmpty) {
              return Center(
                child: Text('loading'),
              );
            } else {
              return ListView.builder(
                itemCount: controller.consultations.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  // var consultation = controller.consultations[index];
                  return Container(
                    margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Post(
                            messege: Text(controller
                                .consultations[index].consultationText),
                            username: 'username',
                            time: DateTime.parse(
                                controller.consultations[index].createdAt),
                            userImage: 'image/PI.jpeg'),
                        Container(
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.all(10),
                          child: IconButton(
                            icon: Icon(
                              MyFlutterApp.commentEmpty,
                              color: deepPurple,
                            ),
                            onPressed: () {
                              return showDialogConsulation(
                                  controller.consultations[index].id);
                            },
                          ),
                        ),
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

class Answered extends StatelessWidget {
  Answered({super.key});
  final ConsultationController controller = Get.put(ConsultationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Obx(() {
          if (controller.consultations.isEmpty) {
            return Center(
              child: Text('loading'),
            );
          } else {
            return ListView.builder(
              itemCount: controller.consultations.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: deepPurple),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Post(
                          messege: Text(
                            controller.consultations[index].consultationText,
                            textAlign: TextAlign.justify,
                          ),
                          username: 'username',
                          time: DateTime.parse(
                              controller.consultations[index].createdAt),
                          userImage: 'image/PI.jpeg'),
                      Container(
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.all(10),
                        child: controller.consultations[index].status == 0
                            ? IconButton(
                                icon: Icon(Icons.comment),
                                color: Colors.deepPurple,
                                onPressed: () {})
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    MyFlutterApp.replyAll,
                                    color: deepPurple,
                                  ),
                                  Post(
                                      messege: Text(
                                        controller
                                            .consultations[index].answerText,
                                      ),
                                      username: 'username',
                                      time: DateTime.now(),
                                      userImage: 'image/PI.jpeg'),
                                ],
                              ),
                      ),
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
