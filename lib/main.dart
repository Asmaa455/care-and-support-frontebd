import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supcar/content/consultation.dart';
import 'package:supcar/content/loginas.dart';
import 'package:supcar/patient/addhelp.dart';
import 'package:supcar/patient/addmedicine.dart';
import 'package:supcar/patient/ask.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/view/doctor/addpost.dart';
import 'package:supcar/view/doctor/doctorhome.dart';
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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loginas(),
      initialRoute: '/loginas',
      getPages: [
        GetPage(name: '/home', page: () => Home()),
        GetPage(name: '/ask', page: () => Ask()),
        GetPage(name: '/addpost', page: () => Addpost()),
        GetPage(name: '/doctorhome', page: () => DoctorHome()),
        GetPage(name: '/help', page: () => Help()),
        GetPage(name: '/volunteerhome', page: () => Volunteerhome()),
        GetPage(name: '/replayhelp', page: () => Replayhelp()),
        GetPage(name: '/addhelp', page: () => Addhelp()),
        GetPage(name: '/consultation', page: () => Consultation()),
        GetPage(name: '/loginas', page: () => Loginas()),
        GetPage(name: '/doctorask', page: () => Doctorask()),
        GetPage(name: '/addmedicine', page: () => Addmedicine())
      ],
    );
  }
}
