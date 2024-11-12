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

  List<Widget> listwidget = [Homepatient(), Medicine(), Doctorsearch()];
  List<String> nameWidget = ['Home Patient', 'Medicine', 'Ask Doctor '];
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
            child: Text(' my account'),
            decoration: BoxDecoration(
              color: pink,
            ),
          ),
          ListTile(
            leading: Image.network(
              'https://th.bing.com/th?id=OIP.GqGVPkLpUlSo5SmeDogUdwHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.4&pid=3.1&rm=2',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(
              'data',
              style: TextStyle(
                  fontSize: 20, color: const Color.fromARGB(255, 6, 82, 120)),
            ),
            tileColor: const Color.fromARGB(255, 209, 192, 230),
            subtitle: Text('email'),
          ),
          ListTile(
              // leading: Icon(Icons.),
              )
        ]),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: listwidget.elementAt(selectedIndex)),
    );
  }
}
