import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/content/valid.dart';
import 'package:supcar/controller/askcontroller.dart';

class Ask extends StatelessWidget {
  final AskController controller = Get.put(AskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ask Doctor',
          style: TextStyle(color: lightPink),
        ),
        backgroundColor: deepPurple,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              children: [
                Form1(
                  key: controller.formKey.value,
                  max: 15,
                  hint1: 'Write Your Consultation',
                  mycontroller: controller.content,
                  valid: (val) {
                    return vaidInput(val!, 40, 1000);
                  },
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    if (controller.formKey.value.currentState!.validate()) {
                      controller.addConsultation(controller.patientId);
                    } else {
                      print('Form validation failed');
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(pink),
                  ),
                  child: Text('Send Consultation'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
