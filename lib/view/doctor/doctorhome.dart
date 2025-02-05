import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/locale/localecontroller.dart';
import 'package:supcar/main.dart';
import 'package:supcar/view/doctor/consultation.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/controller/doctorhomecontroller.dart';
import 'package:supcar/view/doctor/viewpostfordoctor.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';
import 'package:supcar/view/patient/patient.dart';

class DoctorHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DoctorHomeController controller = Get.put(DoctorHomeController());
    final MyLocaleController controllerLan = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepPurple,
        title: Text(
          '103'.tr,
          style: TextStyle(color: lightPink, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: deepPurple,
          selectedItemColor: lightPink,
          unselectedItemColor: Colors.white,
          iconSize: 35,
          onTap: controller.updateIndex,
          currentIndex: controller.selectedIndex.value,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '1'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.nounConsultation),
              label: '3'.tr,
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                Get.toNamed('doctorprofile');
              },
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('image/PI.jpeg'),
                      backgroundColor: Colors.grey,
                    ),
                    Expanded(
                      child: ListTile(
                        style: ListTileStyle.drawer,
                        title: Text(
                          '${sharedPref.getString('first_name')} ${sharedPref.getString('second_name')}',
                          style: TextStyle(fontSize: 20, color: deepPurple),
                        ),
                        subtitle: Text(
                          '${sharedPref.getString('email')}',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => Get.toNamed('myconsultation'),
              child: ListTile(
                leading: Icon(
                  MyFlutterApp.nounConsultation,
                  weight: 2,
                ),
                title: Text(
                  '111'.tr,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.account_balance_wallet_outlined,
                weight: 2,
              ),
              title: Text(
                '137'.tr,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            InkWell(
              onTap: () => Get.toNamed('mypost'),
              child: ListTile(
                leading: Icon(
                  Icons.newspaper,
                  weight: 2,
                ),
                title: Text(
                  '112'.tr,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
                leading: Icon(
                  Icons.language,
                  weight: 2,
                ),
                title: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          controllerLan.changeLang('ar');
                        },
                        child: Text('138'.tr)),
                    TextButton(
                        onPressed: () {
                          controllerLan.changeLang('en');
                        },
                        child: Text('139'.tr))
                  ],
                )),
          ],
        ),
      ),
      body: Obx(
        () => controller.listWidget.elementAt(controller.selectedIndex.value),
      ),
    );
  }
}
