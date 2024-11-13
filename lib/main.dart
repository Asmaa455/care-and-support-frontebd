import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supcar/content/consultation.dart';
import 'package:supcar/content/loginas.dart';
import 'package:supcar/patient/addhelp.dart';
import 'package:supcar/patient/ask.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/doctor/addpost.dart';
import 'package:supcar/doctor/doctorhome.dart';
import 'package:supcar/patient/doctorask.dart';
import 'package:supcar/patient/help.dart';
import 'package:supcar/patient/home.dart';
import 'package:supcar/patient/patient.dart';
import 'package:supcar/volunteer/replayhelp.dart';
import 'package:supcar/volunteer/volunteerhome.dart';

late SharedPreferences sharedPref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loginas(),
      initialRoute: 'loginas',
      routes: {
        'home': (context) => Home(),
        'ask': (context) => Ask(),
        'addpost': (context) => Addpost(),
        'doctorhome': (context) => Doctorhome(),
        'help': (context) => Help(),
        'volunteerhome': (context) => Volunteerhome(),
        'replayhelp': (context) => Replayhelp(),
        'addhelp': (context) => Addhelp(),
        'onsultation': (context) => Consultation(),
        'loginas': (context) => Loginas(),
        'doctorask': (context) => Doctorask()
      },
    );
  }
}
