import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/content/valid.dart';
import 'package:supcar/controller/logincontroller.dart';

class Login extends StatelessWidget {
  Login({super.key});
  Logincontroller controller = Get.put(Logincontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key: controller.formstate1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              TextButton(
                  onPressed: () {
                    if (controller.formstate1.currentState?.validate() ??
                        false) {
                      controller.login();
                      print('Form validation successful');
                    } else {
                      print('Form validation failed');
                    }
                  },
                  child: Text('Login')),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('if you dont have accout'),
                  TextButton(
                      onPressed: () {
                        Get.toNamed('signup');
                      },
                      child: Text('SignUp'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
