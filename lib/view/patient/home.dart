import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/controller/patienthomecontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';
import 'package:supcar/view/patient/doctorask.dart';
import 'package:supcar/view/patient/patient.dart';
import 'package:supcar/view/patient/medicine.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

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
          () => Text(
            controller.nameWidget.elementAt(controller.selectedIndex.value),
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
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 35,
              ),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                MyFlutterApp.nounMedicine,
                size: 35,
              ),
              label: 'Medicine',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                MyFlutterApp.doc,
                size: 35,
              ),
              label: 'Ask Doctor',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.date_range_outlined,
                size: 35,
              ),
              label: 'measure',
            ),
          ],
          selectedFontSize: 20,
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
          ],
        ),
      ),
      body: Obx(
        () => controller.listwidget.elementAt(controller.selectedIndex.value),
      ),
    );
  }
}
