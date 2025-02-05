import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/content/valid.dart';
import 'package:supcar/controller/signupcontroller.dart';
import 'package:supcar/main.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  Signupcontroller controller = Get.put(Signupcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Form(
              key: controller.formstate1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form1(
                      lebal: 'First Name',
                      mycontroller: controller.firstName,
                      valid: (p0) {
                        return Valid().vaidInput(p0!, 2, 20);
                      },
                      max: 1),
                  Form1(
                      lebal: 'Second Name',
                      mycontroller: controller.secondName,
                      valid: (p0) {
                        return Valid().vaidInput(p0!, 2, 20);
                      },
                      max: 1),
                  Form1(
                      lebal: 'Email',
                      mycontroller: controller.email,
                      valid: (p0) {
                        return Valid().vaidInput(p0!, 5, 20);
                      },
                      max: 1),
                  Obx(
                    () => Form1(
                        lebal: 'Password',
                        mycontroller: controller.password,
                        icon: Icon(
                          controller.obscureText.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: controller
                            .togglePasswordVisibility, // استدعاء الدالة مباشرة
                        obscure: controller.obscureText.value,
                        valid: (value) {
                          String? result =
                              Valid().validatePassword(value ?? '');
                          if (result != null) {
                            return result;
                          }
                          return null;
                        },
                        max: 1),
                  ),
                  Obx(
                    () => Form1(
                        lebal: 'Confirm Password',
                        mycontroller: controller.conformePassword,
                        icon: Icon(
                          controller.obscureText.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: controller
                            .togglePasswordVisibility, // استدعاء الدالة مباشرة
                        obscure: controller.obscureText.value,
                        valid: (value) {
                          if (value != controller.password.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        max: 1),
                  ),
                  Obx(
                    () => Row(
                      children: [
                        Text('User Type: '),
                        Expanded(
                          child: Container(
                            child: DropdownButton<String>(
                              items: controller.useratype
                                  .map((e) => DropdownMenuItem<String>(
                                        child: Text('$e'),
                                        value: e.toString(),
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                controller.type.value = val;
                              },
                              value: controller.type.value,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        if (controller.formstate1.currentState?.validate() ??
                            false) {
                          controller.createAcount();
                          print('Form validation successful');
                        } else {
                          print('Form validation failed');
                        }
                      },
                      child: Text('Sign Up')),
                  TextButton(
                      onPressed: () {
                        print(sharedPref.getString('token'));
                        Get.toNamed('loginas');
                      },
                      child: Text('Already have an account? Log in')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('If you have an account, '),
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
          ),
        ],
      ),
    );
  }
}
