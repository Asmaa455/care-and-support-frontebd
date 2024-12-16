import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:supcar/constent/color.dart';
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
            GridView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisExtent: 120,
              ),
              itemCount: controller.weight.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.yellow[50],
                  child: Container(
                    height: 100,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: deepPurple,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          child: Icon(
                            MyFlutterApp.nounDiabetesTest,
                            size: 50,
                            weight: 100,
                            color: Colors.yellow,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${controller.weight[index].value}',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Time: ${DateFormat('HH:mm:ss').format(controller.weight[index].createAt)}',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ])),
    );
  }
}
