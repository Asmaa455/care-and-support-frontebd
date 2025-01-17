import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';

class Loginas extends StatefulWidget {
  const Loginas({super.key});

  @override
  State<Loginas> createState() => _LoginasState();
}

class _LoginasState extends State<Loginas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              loginAsContainar(
                onPressed: () {
                  Get.toNamed('doctorhome');
                },
                title: 'SignUp As Doctor',
              ),
              loginAsContainar(
                  onPressed: () {
                    Get.toNamed('home');
                  },
                  title: 'SignUp As Patient'),
              loginAsContainar(
                  onPressed: () {
                    Get.toNamed('volunteerhome');
                  },
                  title: 'SignUp As volunteer'),
              loginAsContainar(
                onPressed: () {
                  Get.offAllNamed('aspatient');
                },
                title: 'SignUp As Patient',
              ),
              loginAsContainar(
                  onPressed: () {
                    Get.offAllNamed('asdoctor');
                  },
                  title: ' SignUp As Doctor'),
              loginAsContainar(
                  onPressed: () {
                    Get.offAllNamed('asvolunteer');
                  },
                  title: 'SignUp As volunteer'),
            ],
          ),
        ),
      ),
    );
  }
}

class loginAsContainar extends StatelessWidget {
  const loginAsContainar(
      {super.key, required this.onPressed, required this.title});
  final void Function() onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      width: 100,
      alignment: Alignment.center,
      child: TextButton(onPressed: onPressed, child: Text(title)),
      decoration: BoxDecoration(
          color: lightPink,
          border: Border.all(color: deepPurple),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
