import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supcar/locale/locale.dart';
import 'package:supcar/locale/localecontroller.dart';
import 'package:supcar/stripe_payment/stripe_keys.dart';
import 'package:supcar/view/auth/asdoctor.dart';
import 'package:supcar/view/auth/aspatient.dart';
import 'package:supcar/view/auth/asvolenteer.dart';
import 'package:supcar/view/auth/login.dart';
import 'package:supcar/view/auth/signup.dart';
import 'package:supcar/view/doctor/consultation.dart';
import 'package:supcar/view/auth/loginas.dart';
import 'package:supcar/controller/doctorask/doctoraskbinding.dart';
import 'package:supcar/view/doctor/doctor_profile.dart';
import 'package:supcar/view/doctor/myconsulation.dart';
import 'package:supcar/view/doctor/mypost.dart';
import 'package:supcar/view/doctor/update_profile.dart';
import 'package:supcar/view/doctor/viewpostfordoctor.dart';
import 'package:supcar/view/patient/BloodPressure.dart';
import 'package:supcar/view/patient/Patient_profile.dart';
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
import 'package:supcar/view/patient/doctorsearch.dart';
import 'package:supcar/view/patient/help.dart';
import 'package:supcar/view/patient/home.dart';
import 'package:supcar/view/patient/measure.dart';
import 'package:supcar/view/patient/medicine.dart';
import 'package:supcar/view/patient/medicineDetails.dart';
import 'package:supcar/view/patient/mentalhealth.dart';
import 'package:supcar/view/patient/patient.dart';
import 'package:supcar/view/patient/sugar.dart';
import 'package:supcar/view/patient/update_patent_profile.dart';
import 'package:supcar/view/patient/weight.dart';
import 'package:supcar/view/volunteer/edit_profile.dart';
import 'package:supcar/view/volunteer/replayhelp.dart';
import 'package:supcar/view/volunteer/volunteer_profile.dart';
import 'package:supcar/view/volunteer/volunteerhome.dart';
import 'dart:io' if (dart.library.html) 'dart:html';
import 'package:flutter/foundation.dart';

late SharedPreferences sharedPref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  // Stripe.publishableKey = ApiKeys.publishableKeys;
  if (kIsWeb) {
    // Some web specific code there
  } else if (defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.android) {
    // Some android/ios specific code
  } else if (defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.windows ||
      defaultTargetPlatform == TargetPlatform.fuchsia) {
    // Some desktop specific code there
  }

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
      home: Login(),
      initialRoute: '/login',
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
        GetPage(name: '/doctorsearch', page: () => Doctorsearch()),
        GetPage(name: '/login', page: () => Login()),
        GetPage(name: '/signup', page: () => Signup()),
        GetPage(name: '/aspatient', page: () => AsPatient()),
        GetPage(name: '/asdoctor', page: () => AsDoctor()),
        GetPage(name: '/asvolunteer', page: () => AsVolunteer()),
        GetPage(name: '/doctorprofile', page: () => DoctorProfile()),
        GetPage(name: '/volunteerprofile', page: () => VolunteerProfile()),
        GetPage(name: '/editprofile', page: () => EditProfile()),
        GetPage(name: '/uodateprofiledoctor', page: () => UpdateProfile()),
        GetPage(name: '/patentprofile', page: () => PatientProfile()),
        GetPage(
            name: '/updatepatentprofile', page: () => UpdatePatentProfile()),
      ],
    );
  }
}
