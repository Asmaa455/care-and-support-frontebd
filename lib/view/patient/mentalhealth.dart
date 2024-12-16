import 'package:flutter/material.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class Mentalhealth extends StatelessWidget {
  const Mentalhealth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(
          MyFlutterApp.nounMentalHealth,
          color: lightPink,
          weight: 2,
          size: 50,
        ),
        backgroundColor: deepPurple,
        centerTitle: true,
      ),
    );
  }
}
