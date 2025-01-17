import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/content/valid.dart';
import 'package:supcar/controller/signupcontroller.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  Signupcontroller controller = Get.put(Signupcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form1(
                hint1: 'first name',
                mycontroller: controller.firstName,
                valid: (p0) {
                  return Valid().vaidInput(p0!, 5, 20);
                },
                max: 1),
            Form1(
                hint1: 'second name',
                mycontroller: controller.secondName,
                valid: (p0) {
                  return Valid().vaidInput(p0!, 5, 20);
                },
                max: 1),
            Form1(
                hint1: 'Email',
                mycontroller: controller.email,
                valid: (p0) {
                  return Valid().vaidInput(p0!, 5, 20);
                },
                max: 1),
            Form1(
                hint1: 'Password',
                mycontroller: controller.password,
                valid: (p0) {
                  return Valid().vaidInput(p0!, 5, 20);
                },
                max: 1),
            Form1(
                hint1: 'Password',
                mycontroller: controller.password,
                valid: (p0) {
                  return Valid().vaidInput(p0!, 5, 20);
                },
                max: 1),
            TextButton(
                onPressed: () {
                  Get.offAllNamed('loginas');
                },
                child: Text('signUp')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('if you have accout'),
                TextButton(
                    onPressed: () {
                      Get.toNamed('login');
                    },
                    child: Text('Login'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
