import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/content/valid.dart';
import 'package:supcar/controller/replayhelocontroller.dart';

class Replayhelp extends StatelessWidget {
  final ReplayhelpController controller = Get.put(ReplayhelpController());

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
            Column(
              children: [
                Form(
                  key: controller.formKey.value,
                  child: Form1(
                    hint1: 'Repaly To Help',
                    mycontroller: controller.help.value,
                    valid: (val) {
                      return vaidInput(val!, 5, 1000);
                    },
                    max: 15,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: deepPurple),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextButton(
                    onPressed: controller.submitForm,
                    child: Text(
                      "Replay Help",
                      style: TextStyle(
                          color: deepPurple, fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(pink),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
