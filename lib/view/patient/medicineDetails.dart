import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/convert_time.dart';
import 'package:supcar/content/time_line_tile.dart';
import 'package:supcar/controller/medicine_detailcontroller.dart';
import 'package:supcar/controller/medicinecontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';
import 'package:supcar/model/medicineModel.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MedicineDetails extends StatelessWidget {
  MedicineDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final MedicineDetailController controller =
        Get.put(MedicineDetailController());
    final MedicineController controllerMed = Get.put(MedicineController());
    // تحديث جدول الأوقات عند إنشاء الصفحة

    return Scaffold(
        appBar: AppBar(
          title: Icon(
            MyFlutterApp.pills,
            color: lightPink,
          ),
          backgroundColor: deepPurple,
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: ListView.builder(
              itemCount: controller.filterMedicinesByDate.length,
              itemBuilder: (context, index) {
                return TimeLineTile1(
                  isFirst: index == 0,
                  isPast: controller.filterMedicinesByDate[index].status == 1,
                  isLast: index + 1 == controller.filterMedicinesByDate.length,
                  evenCard: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                          ' ${formatTimeOfDay(controller.filterMedicinesByDate[index].time)}'),
                      InkWell(
                        onTap: () {
                          controller.setStatus(1);
                          controller.addStatus(
                              controller.filterMedicinesByDate[index].id);
                        },
                        child: controller.filterMedicinesByDate[index].status !=
                                1
                            ? Container(
                                width: 100,
                                child:
                                    Icon(Icons.check_box_outline_blank_sharp),
                              )
                            : Container(),
                      )
                    ],
                  ),
                );
              }),
        ));
  }
}
