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
            Form(
              key: controller.formstate1,
              child: Column(
                children: [
                  TextFormField(
                    maxLines: 15,
                    decoration:
                        InputDecoration(hintText: 'Write Your Consultation'),
                    controller: controller.content,
                    validator: (val) {
                      return vaidInput(val!, 5, 1000);
                    },
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      if (controller.formstate1.currentState?.validate() ??
                          false) {
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
            ),
          ],
        ),
      ),
    );
  }
}
