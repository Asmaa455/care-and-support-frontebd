import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/consultation.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';
import 'package:supcar/patient/patient.dart';

class Doctorhome extends StatefulWidget {
  const Doctorhome({super.key});
  @override
  State<Doctorhome> createState() => _DoctorhomeState();
}

class _DoctorhomeState extends State<Doctorhome> {
  int selectedIndex = 0;
  List<Widget> listWidget = [Homepatient(), Consultation()];
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: lightPink,
        onPressed: () {
          Navigator.of(context).pushNamed('addpost');
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: ListView(
          children: [
            Post(
                messege: 'messege',
                username: 'username',
                time: DateTime.now(),
                userImage: 'image/PI.jpeg')
          ],
        ),
      ),
    );
  }
}
