// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter/material.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/patient/doctorask.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';
import 'package:supcar/patient/patient.dart';
import 'package:supcar/patient/medicine.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomepatientState();
}

class _HomepatientState extends State<Home> {
  int selectedIndex = 0;

  List<Widget> listwidget = [Homepatient(), Medicine(), Doctorask()];
  List<String> nameWidget = ['Home Patient', 'Medicine', 'Ask Doctor '];
  String userImage = 'image/PI.jpeg';
  String username = 'username';
  String email = 'username@gmail.com';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                MyFlutterApp.noun_doctor_search_3862138,
                size: 50,
                weight: 100,
                color: pink,
              )),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('help');
              },
              icon: Icon(
                Icons.volunteer_activism_outlined,
                size: 35,
                weight: 100,
                color: pink,
              )),
        ],
        backgroundColor: deepPurple,
        title: Text(
          nameWidget.elementAt(selectedIndex),
          style: TextStyle(
            color: pink,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        currentIndex: selectedIndex,
        backgroundColor: deepPurple,
        unselectedItemColor: pink,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 35,
              ),
              label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(
                MyFlutterApp.noun_medicine_7230298,
                size: 35,
              ),
              label: 'Medicine'),
          BottomNavigationBarItem(
              icon: Icon(
                MyFlutterApp.doc,
                size: 35,
              ),
              label: 'Ask Doctor'),
          BottomNavigationBarItem(
              icon: Icon(
                // add icon for data measure
                Icons.date_range_outlined,
                size: 35,
              ),
              label: 'measure'),
        ],
        selectedFontSize: 20,
        selectedItemColor: lightPink,
      ),
      drawer: Drawer(
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
        ]),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: listwidget.elementAt(selectedIndex)),
    );
  }
}
