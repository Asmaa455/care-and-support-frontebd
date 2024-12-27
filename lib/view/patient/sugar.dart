import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/constent/stringtodata.dart';
import 'package:supcar/content/grid.dart';
import 'package:supcar/controller/Measurecontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';
import 'package:intl/intl.dart';

class Sugar extends StatelessWidget {
  Sugar({super.key});
  final Measurecontroller controller = Get.put(Measurecontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Icon(
            MyFlutterApp.nounDiabetesTest,
            color: lightPink,
            weight: 2,
            size: 50,
          ),
          backgroundColor: deepPurple,
          centerTitle: true,
        ),
        body: Obx(() => ListView(scrollDirection: Axis.vertical, children: [
              CustomGrid(
                  controller: controller,
                  color: lightBlue,
                  borderColor: deepPurple,
                  iconColor: Colors.blue,
                  itemCount: controller.sugar.length,
                  icon: MyFlutterApp.nounDiabetesTest,
                  pressure: controller.sugar)
            ])));
  }
}
