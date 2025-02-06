// ملف الواجهة: medicine_details.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/convert_time.dart';
import 'package:supcar/content/time_line_tile.dart';
import 'package:supcar/controller/medicine_detailcontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class MedicineDetails extends StatelessWidget {
  MedicineDetails({super.key});

  final MedicineDetailController controller =
      Get.put(MedicineDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${controller.medName}',
          style: TextStyle(color: lightPink, fontWeight: FontWeight.bold),
        ),
        backgroundColor: deepPurple,
        centerTitle: true,
      ),
      body: Obx(() {
        // if (controller.isLoading.value) {
        //   return Center(child: CircularProgressIndicator(color: pink));
        // }

        // if (controller.medication.isEmpty) {
        //   return Center(child: Text("No medication details found".tr));
        // }

        // final filteredList = controller.filterMedicinesByDate;
        // print('Filtered list length: ${filteredList.length}');

        // if (filteredList.isEmpty) {
        //   return Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Text("No medications for selected date".tr),
        //         TextButton(
        //           onPressed: () => Get.back(),
        //           child: Text("Change date".tr),
        //         )
        //       ],
        //     ),
        //   );
        // }
        return ListView.builder(
          padding: EdgeInsets.all(20),
          itemCount: controller.getMedicationsForSelectedDate().length,
          itemBuilder: (context, index) {
            return TimeLineTile1(
              isFirst: index == 0,
              isPast:
                  controller.getMedicationsForSelectedDate()[index].status == 1,
              isLast: index ==
                  controller.getMedicationsForSelectedDate().length - 1,
              evenCard: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(formatTimeOfDay(
                      controller.getMedicationsForSelectedDate()[index].time)),
                  if (controller
                          .getMedicationsForSelectedDate()[index]
                          .status !=
                      1)
                    IconButton(
                      icon: Icon(Icons.check_box_outline_blank),
                      onPressed: () {
                        controller.setStatus(1);
                        controller.addStatus(controller
                            .getMedicationsForSelectedDate()[index]
                            .id);
                        controller.medicationwithId();
                      },
                    )
                  else
                    IconButton(
                        onPressed: () {
                          controller.setStatus(0);
                          controller.addStatus(controller
                              .getMedicationsForSelectedDate()[index]
                              .id);
                          controller.medicationwithId();
                        },
                        icon: Icon(Icons.check_box, color: deepPurple)),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
