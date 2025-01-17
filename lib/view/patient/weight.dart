import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/grid.dart';
import 'package:supcar/controller/Measurecontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class Weight extends StatelessWidget {
  Weight({super.key});
  final Measurecontroller controller = Get.put(Measurecontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(
          MyFlutterApp.nounWeight,
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
                color: lightYellow,
                borderColor: deepPurple,
                iconColor: const Color.fromARGB(255, 178, 166, 56),
                itemCount: controller.weight.length,
                icon: MyFlutterApp.nounWeight,
                pressure: controller.weight)
          ])),
    );
  }
}
