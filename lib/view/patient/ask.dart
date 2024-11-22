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
        child: ListView(
          children: [
            Form1(
              max: 15,
              hint1: 'Write Your Consultation',
              mycontroller: controller.content,
              valid: (val) {
                return vaidInput(val!, 40, 1000);
              },
            ),
            Obx(
              () => TextButton(
                onPressed: controller.isLoading.value
                    ? null
                    : controller.addConsultation,
                child: controller.isLoading.value
                    ? CircularProgressIndicator()
                    : Text('Send Consultation'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(pink),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
