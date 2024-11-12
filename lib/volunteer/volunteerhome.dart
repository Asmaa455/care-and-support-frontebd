import 'dart:math';

import 'package:flutter/material.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/patient/home.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
