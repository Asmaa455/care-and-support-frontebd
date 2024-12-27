import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/controller/doctorask/volunteercontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class VolunteerHome extends StatelessWidget {
  final VolunteerController controller = Get.put(VolunteerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(controller.userImage),
                    backgroundColor: Colors.grey,
                  ),
                  Expanded(
                    child: ListTile(
                      style: ListTileStyle.drawer,
                      title: Text(
                        controller.username,
                        style: TextStyle(fontSize: 20, color: deepPurple),
                      ),
                      subtitle: Text(
                        controller.email,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(MyFlutterApp.nounConsultation),
              title: Text(
                'My Consultiation',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet_outlined),
              title: Text(
                'My Paid',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Volunteer',
          style: TextStyle(color: lightPink, fontWeight: FontWeight.bold),
        ),
        backgroundColor: deepPurple,
        titleSpacing: 2,
        centerTitle: true,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: deepPurple,
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: lightPink,
          unselectedItemColor: pink,
          onTap: controller.changeIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.volunteer_activism,
                ),
                label: 'help')
          ],
        ),
      ),
      body: Obx(
        () => Container(
          height: double.infinity,
          width: double.infinity,
          child: controller.listWidget[controller.selectedIndex.value],
        ),
      ),
    );
  }
}
