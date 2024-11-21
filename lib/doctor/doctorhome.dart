import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/consultation.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/doctor/viewpostfordoctor.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';
import 'package:supcar/patient/patient.dart';

class Doctorhome extends StatefulWidget {
  const Doctorhome({super.key});
  @override
  State<Doctorhome> createState() => _DoctorhomeState();
}

class _DoctorhomeState extends State<Doctorhome> {
  String userImage = 'image/PI.jpeg';
  String username = 'username';
  String email = 'username@gmail.com';
  int selectedIndex = 0;
  List<Widget> listWidget = [Viewpostfordoctor(), Consultation()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepPurple,
        title: Text(
          'Doctor',
          style: TextStyle(color: lightPink, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: deepPurple,
          selectedItemColor: lightPink,
          unselectedItemColor: Colors.white,
          iconSize: 35,
          onTap: (val) {
            setState(() {
              selectedIndex = val;
            });
          },
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
                icon: Icon(MyFlutterApp.noun_consultation_6696850),
                label: 'consultation')
          ]),
      endDrawer: Drawer(
        child: ListView(children: [
          DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(userImage),
                    backgroundColor: Colors.grey,
                  ),
                  Expanded(
                      child: ListTile(
                    style: ListTileStyle.drawer,
                    title: Text(
                      username,
                      style: TextStyle(fontSize: 20, color: deepPurple),
                    ),
                    subtitle: Text(
                      email,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ))
                ],
              )),
          Expanded(
              child: ListTile(
            leading: Icon(
              MyFlutterApp.noun_consultation_6696850,
              weight: 2,
            ),
            title: Text(
              'My Consultiation',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
          Expanded(
              child: ListTile(
                  leading: Icon(
                    Icons.account_balance_wallet_outlined,
                    weight: 2,
                  ),
                  title: Text(
                    'My Paid',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
          Expanded(
              child: ListTile(
                  leading: Icon(
                    Icons.newspaper,
                    weight: 2,
                  ),
                  title: Text(
                    'My Posts',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
        ]),
      ),
      body: Container(child: listWidget.elementAt(selectedIndex)),
    );
  }
}
