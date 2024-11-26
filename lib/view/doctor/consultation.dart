import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/controller/consultationcontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class Consultation extends StatelessWidget {
  final ConsultationController controller = Get.put(ConsultationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        // decoration: BoxDecoration(
        //     border: Border.all(color: Colors.deepPurple),
        //     borderRadius: BorderRadius.circular(10)),
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
                  decoration: BoxDecoration(
                      border: Border.all(color: lightPink),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Post(
                          messege:
                              controller.consultations[index].consultationText,
                          username: 'username',
                          time: DateTime.now(),
                          userImage: 'image/PI.jpeg'),
                      Container(
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.all(10),
                        child: controller.consultations[index].status == 0
                            ? IconButton(
                                icon: Icon(Icons.comment),
                                color: Colors.deepPurple,
                                onPressed: () => showDialogConsulation(
                                    controller.consultations[index].patientId))
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    MyFlutterApp.reply_all,
                                    color: deepPurple,
                                  ),
                                  Post(
                                      messege: controller
                                          .consultations[index].answerText,
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

  void showDialogConsulation(int patientId) {
    Get.dialog(
      AlertDialog(
        title: Text("Reply to the consultation"),
        content: Form(
          key: controller.formKey.value,
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
          // TextButton(
          //   // onPressed: () => controller.replayConsultation(patientId),
          //   child: Text('Add Reply'),
          // ),
        ],
      ),
    );
  }
}
