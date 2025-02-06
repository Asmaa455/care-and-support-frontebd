import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/constent/stringtodata.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';
import 'package:supcar/model/patientModel.dart';
import 'package:supcar/model/userModel.dart';

class PatientProfileController extends GetxController {
  var patientData = Patient(
    id: 0,
    userId: 0,
    age: 0,
    gender: 'gender',
    diseases: 'diseases',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    user: User(
        id: 0,
        firstName: 'firstName',
        secondName: 'secondName',
        email: 'email',
        type: '',
        createdAt: DateTime.now()),
  ).obs;
  var isLoading = true.obs;
  TextEditingController firstNamecontroller = TextEditingController();
  TextEditingController secondNamecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController gendercontroller = TextEditingController();
  TextEditingController diseasescontroller = TextEditingController();
  GlobalKey<FormState> formstate1 = GlobalKey();
  @override
  void onInit() {
    super.onInit();
    fetchPatientDataFromApi();
  }

  void fetchPatientDataFromApi() async {
    try {
      isLoading(true);
      Patient patient = await ApiService().fetchPatientData();
      patientData.value = patient;

      agecontroller.text = patientData.value.age.toString();
      gendercontroller.text = patientData.value.gender;
      diseasescontroller.text = patientData.value.diseases;
      firstNamecontroller.text = patientData.value.user.firstName;
      secondNamecontroller.text = patientData.value.user.secondName;
      print("Patient Data: ${patientData.value.user.firstName}");
    } catch (e) {
      print("Error fetching volunteer data: $e");
    } finally {
      isLoading(false);
    }
  }

//تحديث بيانات المتطوعين
  void updatepatientData() async {
    isLoading.value = true;
    String url = '$serverLink$updatePatientDataLink';
    print("URL: $url"); // طباعة الرابط

    if (formstate1.currentState != null &&
        formstate1.currentState!.validate()) {
      var requestBody = {
        'first_name': firstNamecontroller.text,
        'second_name': secondNamecontroller.text,
        'age': agecontroller.text,
        'gender': gendercontroller.text,
        'diseases': diseasescontroller.text
      };
      print("Request Body: $requestBody"); // طباعة البيانات المرسلة

      var response = await ApiService().postRequest1(url, requestBody);
      isLoading.value = false;

      if (response != null &&
          response['message'] == 'Patient data updated successfully') {
        fetchPatientDataFromApi();

        Get.back();
        Get.snackbar('133'.tr, '134'.tr, backgroundColor: pink);
      } else {
        print('Error: ${response?['message']}');
      }
    } else {
      isLoading.value = false;
      print('Form validation failed');
    }
  }
}
