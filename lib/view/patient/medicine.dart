import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/controller/medicinecontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';
import 'package:supcar/view/patient/medicineDetails.dart';

class Medicine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MedicineController controller = Get.put(MedicineController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('addmedicine');
        },
        child: Icon(Icons.add),
      ),
      body: Obx(
        () => Column(
          children: [
            CalendarTimeline(
              initialDate: controller.selectedDate.value,
              firstDate: DateTime(2020, 1, 1),
              lastDate: DateTime(9999, 12, 31),
              onDateSelected: (date) {
                controller.selectedDate.value = date;
              },
              leftMargin: 20,
              monthColor: Colors.blueGrey,
              dayColor: deepPurple,
              activeDayColor: Colors.white,
              activeBackgroundDayColor: lightPink,
              dotColor: Color(0xFF333A47),
              selectableDayPredicate: (date) => date.day != 23,
              locale: 'en_ISO',
            ),
            Expanded(
              child: GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 200,
                ),
                itemCount: controller.getTasksForSelectedDate().length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed("medicinedetails",
                          arguments: controller.medicines[index]);
                    },
                    child: Card(
                      color: pink,
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: deepPurple,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              margin: EdgeInsets.only(top: 20),
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Icon(
                                MyFlutterApp.pills,
                                size: 50,
                                color: deepPurple,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                controller
                                    .getTasksForSelectedDate()[index]
                                    .medicationName,
                                textAlign: TextAlign.center,
                              ),
                              subtitle: Text(
                                controller
                                    .getTasksForSelectedDate()[index]
                                    .amount,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
