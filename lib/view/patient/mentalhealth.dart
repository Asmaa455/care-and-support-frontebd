import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/grid.dart';
import 'package:supcar/controller/Measurecontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class Mentalhealth extends StatelessWidget {
  Mentalhealth({super.key});
  final Measurecontroller controller = Get.put(Measurecontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(
          MyFlutterApp.nounMentalHealth,
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
                color: lightGreen,
                borderColor: deepPurple,
                iconColor: Colors.green,
                itemCount: controller.mentalHealth.length,
                icon: MyFlutterApp.nounMentalHealth,
                pressure: controller.mentalHealth)
          ])),
    );
  }
}
