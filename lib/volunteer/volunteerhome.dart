import 'dart:math';

import 'package:flutter/material.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';
import 'package:supcar/view/patient/home.dart';
import 'package:supcar/patient/patient.dart';
import 'package:supcar/volunteer/showhelp.dart';

class Volunteerhome extends StatefulWidget {
  const Volunteerhome({super.key});

  @override
  State<Volunteerhome> createState() => _VolunteerhomeState();
}

class _VolunteerhomeState extends State<Volunteerhome> {
  int selectedIndex = 0;
  List<Widget> listWidget = [Homepatient(), Showhelp()];
  String userImage = 'image/PI.jpeg';
  String username = 'username';
  String email = 'username@gmail.com';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      appBar: AppBar(
        title: Text(
          'Volunteer',
          style: TextStyle(color: lightPink, fontWeight: FontWeight.bold),
        ),
        backgroundColor: deepPurple,
        titleSpacing: 2,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: deepPurple,
          currentIndex: selectedIndex,
          selectedItemColor: lightPink,
          unselectedItemColor: pink,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.volunteer_activism,
                ),
                label: 'help')
          ]),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: listWidget.elementAt(selectedIndex)),
    );
  }
}
