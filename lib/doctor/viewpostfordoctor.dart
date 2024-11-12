// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter/material.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/customeappbar.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/patient/doctorask.dart';
import 'package:supcar/patient/medicine.dart';

class Viewpostfordoctor extends StatefulWidget {
  const Viewpostfordoctor({super.key});

  @override
  State<Viewpostfordoctor> createState() => _ViewpostfordoctorState();
}

class _ViewpostfordoctorState extends State<Viewpostfordoctor> {
  String story =
      "One crisp morning, as the first snowflakes began to fall, the last golden leaf finally let go of its branch. It danced gracefully through the air, landing softly on the ground. Mr. Thompson watched from his window, a smile breaking through his somber expression. He understood now that while the leaf had fallen, it had not vanished; it had become part of the earth, nourishing the roots for new life to grow.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: lightPink),
                  borderRadius: BorderRadius.circular(15)),
              child: Post(
                messege: 'messege',
                username: 'username',
                time: DateTime.now(),
                userImage: 'image/PI.jpeg',
              ),
            )
          ],
        ),
      ),
    );
  }
}
