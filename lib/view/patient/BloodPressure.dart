import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/constent/stringtodata.dart';
import 'package:supcar/controller/Measurecontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';
import 'package:intl/intl.dart';

class Bloodpressure extends StatelessWidget {
  Bloodpressure({super.key});
  final Measurecontroller controller = Get.put(Measurecontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Icon(
            MyFlutterApp.nounBloodPressure,
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
                itemCount: controller.pressure.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.red[200],
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
                              MyFlutterApp.nounBloodPressure,
                              size: 50,
                              weight: 100,
                              color: Colors.red,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '91'.tr +
                                    ': ${controller.pressure[index].value}',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '92'.tr +
                                    ': ${controller.pressure[index].status}',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '93'.tr +
                                    ': ${DateFormat('HH:mm').format(controller.pressure[index].createAt)}',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              // Text(
                              //   '97'.tr +
                              //       ': ${DateFormat('M/d/y').format(controller.pressure[index].createAt)}',
                              //   textAlign: TextAlign.center,
                              //   style: TextStyle(fontWeight: FontWeight.bold),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ])));
  }
}
