import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/content/valid.dart';
import 'package:supcar/controller/addhelpcontroller.dart';

class Addhelp extends StatelessWidget {
  final AddhelpController controller = Get.put(AddhelpController());

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
                mycontroller: controller.typeHelpController,
                valid: (val) {
                  return vaidInput(val!, 5, 1000);
                },
                max: 3),
            Form1(
                hint1: "location",
                mycontroller: controller.locationController,
                valid: (val) {
                  return vaidInput(val!, 10, 30);
                },
                max: 2),
            Form1(
                hint1: 'Additional details',
                mycontroller: controller.detailsController,
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
                  onPressed: () {
                    // Implement the function to handle form submission
                  },
                  child: Text('Send'),
                )),
          ],
        ),
      ),
    );
  }
}
