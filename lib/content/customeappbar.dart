import 'package:flutter/material.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class Customeappbar extends StatelessWidget {
  final String title;
  const Customeappbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: const Color.fromARGB(255, 224, 201, 234),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(MyFlutterApp.noun_doctor_search_3862138)),
          Expanded(
              child: Text(
            "$title",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
        ],
      ),
    );
  }
}
