import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supcar/locale/locale.dart';
import 'package:supcar/locale/localecontroller.dart';
import 'package:supcar/view/doctor/consultation.dart';
import 'package:supcar/content/loginas.dart';
import 'package:supcar/controller/doctorask/doctoraskbinding.dart';
import 'package:supcar/view/doctor/myconsulation.dart';
import 'package:supcar/view/doctor/mypost.dart';
import 'package:supcar/view/doctor/viewpostfordoctor.dart';
import 'package:supcar/view/patient/BloodPressure.dart';
import 'package:supcar/view/patient/addbloodpre.dart';
import 'package:supcar/view/patient/addhelp.dart';
import 'package:supcar/view/patient/addmedicine.dart';
import 'package:supcar/view/patient/addmentalhealth.dart';
import 'package:supcar/view/patient/addsugar.dart';
import 'package:supcar/view/patient/addweight.dart';
import 'package:supcar/view/patient/ask.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/view/doctor/addpost.dart';
import 'package:supcar/view/doctor/doctorhome.dart';
import 'package:supcar/view/patient/doctorask.dart';
import 'package:supcar/view/patient/help.dart';
import 'package:supcar/view/patient/home.dart';
import 'package:supcar/view/patient/measure.dart';
import 'package:supcar/view/patient/medicine.dart';
import 'package:supcar/view/patient/medicineDetails.dart';
import 'package:supcar/view/patient/mentalhealth.dart';
import 'package:supcar/view/patient/patient.dart';
import 'package:supcar/view/patient/sugar.dart';
import 'package:supcar/view/patient/weight.dart';
import 'package:supcar/view/volunteer/replayhelp.dart';
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
    MyLocaleController controller = Get.put(MyLocaleController());
    return GetMaterialApp(
      locale: controller.initialLang,
      translations: Mylocale(),
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
        GetPage(name: '/addmedicine', page: () => Addmedicine()),
        GetPage(name: '/medicine', page: () => Medicine()),
        GetPage(name: '/measure', page: () => Measure()),
        GetPage(name: '/bloodPressure', page: () => Bloodpressure()),
        GetPage(name: '/medicinedetails', page: () => MedicineDetails()),
        GetPage(name: '/myconsultation', page: () => Myconsulation()),
        GetPage(name: '/mypost', page: () => Mypost()),
        GetPage(name: '/viewpostfordoctor', page: () => Viewpostfordoctor()),
        GetPage(name: '/addbloodpre', page: () => Addbloodpre()),
        GetPage(name: '/bloodpressure', page: () => Bloodpressure()),
        GetPage(name: '/sugar', page: () => Sugar()),
        GetPage(name: '/weight', page: () => Weight()),
        GetPage(name: '/mentalhealth', page: () => Mentalhealth()),
        GetPage(name: '/addsugar', page: () => Addsugar()),
        GetPage(name: '/addweight', page: () => Addweight()),
        GetPage(name: '/addmentalhealth', page: () => AddMentalHealth()),
      ],
    );
  }
}
