import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supcar/view/doctor/consultation.dart';
import 'package:supcar/content/loginas.dart';
import 'package:supcar/controller/doctorask/doctoraskbinding.dart';
import 'package:supcar/view/patient/addhelp.dart';
import 'package:supcar/view/patient/addmedicine.dart';
import 'package:supcar/view/patient/ask.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/view/doctor/addpost.dart';
import 'package:supcar/view/doctor/doctorhome.dart';
import 'package:supcar/view/patient/doctorask.dart';
import 'package:supcar/view/patient/help.dart';
import 'package:supcar/view/patient/home.dart';
import 'package:supcar/view/patient/patient.dart';
import 'package:supcar/volunteer/replayhelp.dart';
import 'package:supcar/view/volunteer/volunteerhome.dart';

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
        GetPage(name: '/volunteerhome', page: () => VolunteerHome()),
        GetPage(name: '/replayhelp', page: () => Replayhelp()),
        GetPage(name: '/addhelp', page: () => Addhelp()),
        GetPage(name: '/consultation', page: () => Consultation()),
        GetPage(name: '/loginas', page: () => Loginas()),
        GetPage(
            name: '/doctorask',
            page: () => Doctorask(),
            binding: Doctoraskbinding()),
        GetPage(name: '/addmedicine', page: () => Addmedicine())
      ],
    );
  }
}
