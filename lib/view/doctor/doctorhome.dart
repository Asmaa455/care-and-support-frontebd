import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepPurple,
        title: Text(
          'Doctor',
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
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.noun_consultation_6696850),
              label: 'consultation',
            ),
          ],
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
                MyFlutterApp.noun_consultation_6696850,
                weight: 2,
              ),
              title: Text(
                'My Consultation',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
            ),
            ListTile(
              leading: Icon(
                Icons.newspaper,
                weight: 2,
              ),
              title: Text(
                'My Posts',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: Obx(
        () => controller.listWidget.elementAt(controller.selectedIndex.value),
      ),
    );
  }
}
