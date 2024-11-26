import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/controller/doctorask/Doctoraskcontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';
import 'package:supcar/model/conModel.dart';

class Doctorask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed('ask');
            },
            child: Icon(Icons.add),
          ),
          appBar: AppBar(
            backgroundColor: pink,
            toolbarHeight: 0,
            bottom: TabBar(tabs: [
              Tab(
                child: Text('My Consultation'),
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
            if (controller.consultations.isEmpty) {
              return Center(
                child: Text('loading'),
              );
            } else {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: controller.consultations.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  // var consultation = controller.consultations[index];
                  return Container(
                    child: Column(
                      children: [
                        Post(
                            messege: controller
                                .consultations[index].consultationText,
                            username: 'Patient',
                            time: DateTime.now(),
                            userImage: 'image/PI.jpeg'),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Icon(MyFlutterApp.reply),
                              ),
                              Post(
                                  messege: controller
                                      .consultations[index].answerText,
                                  username: 'Doctor',
                                  time: DateTime.now(),
                                  userImage: 'image/PI.jpeg'),
                            ],
                          ),
                        )
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

// class NotReplay1 extends StatelessWidget {
//   final NotReplayController controller = Get.put(NotReplayController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Obx(
//           () {
//             if (controller.consultations.isEmpty) {
//               return Center(
//                 child: Text('loading'),
//               );
//             } else {
//               return ListView.builder(
//                 itemCount: controller.consultations.length,
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   // var consultation = controller.consultations[index];
//                   return Container(
//                     child: Column(
//                       children: [
//                         Post(
//                             messege: controller
//                                 .consultations[index].consultationText,
//                             username: 'username',
//                             time: DateTime.parse(
//                                 controller.consultations[index].createdAt),
//                             userImage: 'image/PI.jpeg'),
//                         Container(
//                             alignment: Alignment.topRight,
//                             margin: EdgeInsets.all(10),
//                             child: Icon(
//                               MyFlutterApp.comment_empty,
//                               color: deepPurple,
//                             )),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
