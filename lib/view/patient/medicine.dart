import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/controller/medicinecontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

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
        () => GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 200,
          ),
          itemCount: controller.medicines.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
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
                      Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(
                            controller.medicines[index]['name']!,
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Text(
                            controller.medicines[index]['description']!,
                            textAlign: TextAlign.center,
                          ),
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
    );
  }
}
