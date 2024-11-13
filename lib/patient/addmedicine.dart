import 'package:flutter/material.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class Addmedicine extends StatefulWidget {
  const Addmedicine({super.key});

  @override
  State<Addmedicine> createState() => _AddmedicineState();
}

class _AddmedicineState extends State<Addmedicine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(
          MyFlutterApp.noun_medicine_7230298,
          color: lightPink,
        ),
        backgroundColor: deepPurple,
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: [
            Text('Medicine Name'),
            TextFormField(),
          ],
        ),
      ),
    );
  }
}
