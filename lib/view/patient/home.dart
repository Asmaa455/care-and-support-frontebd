import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/controller/patienthomecontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';
import 'package:supcar/locale/localecontroller.dart';
import 'package:supcar/view/patient/doctorask.dart';
import 'package:supcar/view/patient/patient.dart';
import 'package:supcar/view/patient/medicine.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final MyLocaleController controllerLan = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              MyFlutterApp.nounDoctorSearch,
              size: 50,
              weight: 100,
              color: pink,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed('help');
            },
            icon: Icon(
              Icons.volunteer_activism_outlined,
              size: 35,
              weight: 100,
              color: pink,
            ),
          ),
        ],
        backgroundColor: deepPurple,
        title: Obx(
          () => controller.selectedIndex.value == 0
              ? Icon(
                  Icons.home,
                  color: lightPink,
                  size: 35,
                )
              : Text(
                  controller.nameWidget
                      .elementAt(controller.selectedIndex.value),
                  style: TextStyle(
                    color: pink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: controller.updateIndex,
          currentIndex: controller.selectedIndex.value,
          backgroundColor: deepPurple,
          unselectedItemColor: pink,
          unselectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 35,
              ),
              label: '1'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                MyFlutterApp.nounMedicine,
                size: 35,
              ),
              label: '2'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                MyFlutterApp.doc,
                size: 35,
              ),
              label: '3'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.date_range_outlined,
                size: 35,
              ),
              label: '4'.tr,
            ),
          ],
          selectedFontSize: 18,
          selectedItemColor: lightPink,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
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
                        'username',
                        style: TextStyle(fontSize: 20, color: deepPurple),
                      ),
                      subtitle: Text(
                        'username@gmail.com',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                MyFlutterApp.nounConsultation,
                weight: 2,
              ),
              title: Text(
                'My Consultation',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Get.toNamed('/consultation');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.account_balance_wallet_outlined,
                weight: 2,
              ),
              title: Text(
                'My Paid',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Get.toNamed('/mypaid');
              },
            ),
            Row(
              children: [
                Icon(Icons.language),
                TextButton(
                    onPressed: () {
                      controllerLan.changeLang('ar');
                    },
                    child: Text('arabic')),
                TextButton(
                    onPressed: () {
                      controllerLan.changeLang('en');
                    },
                    child: Text('english'))
              ],
            )
          ],
        ),
      ),
      body: Obx(
        () => controller.listwidget.elementAt(controller.selectedIndex.value),
      ),
    );
  }
}
