// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/controller/showhelpcontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class Showhelp extends StatelessWidget {
  final ShowhelpController controller = Get.put(ShowhelpController());

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
                labelStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                unselectedLabelStyle:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                indicatorColor: deepPurple,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Text(
                    'مقبولة',
                  ),
                  Text('غير مقبولة')
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
    return Scaffold();
  }
}

class Unacceptable extends StatelessWidget {
  Unacceptable({super.key});
  UnacceptableController controller = Get.put(UnacceptableController());

  @override
  Widget build(BuildContext context) {
    return Scaffold();
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
