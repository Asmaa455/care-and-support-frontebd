import 'package:flutter/material.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/content/valid.dart';

class Addhelp extends StatefulWidget {
  const Addhelp({super.key});

  @override
  State<Addhelp> createState() => _AddhelpState();
}

class _AddhelpState extends State<Addhelp> {
  TextEditingController typeHelpController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(
          Icons.volunteer_activism,
          color: lightPink,
        ),
        centerTitle: true,
        backgroundColor: deepPurple,
      ),
      body: Container(
        child: ListView(
          children: [
            Form1(
                hint1: 'Help Type',
                mycontroller: typeHelpController,
                valid: (val) {
                  return vaidInput(val!, 5, 1000);
                },
                max: 3),
            Form1(
                hint1: "location",
                mycontroller: locationController,
                //use gps for that
                valid: (val) {
                  return vaidInput(val!, 10, 30);
                },
                max: 2),
            Form1(
                hint1: 'Additional details',
                mycontroller: detailsController,
                valid: (val) {
                  return vaidInput(val!, 0, 200);
                },
                max: 2),
            Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: pink,
                  border: Border.all(color: deepPurple),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text('Send'),
                  // style: ButtonStyle(
                  //   backgroundColor: WidgetStateProperty.all(pink),
                  // ),
                )),
          ],
        ),
      ),
    );
  }
}
