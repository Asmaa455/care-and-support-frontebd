import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';
import 'package:supcar/model/doctorModel.dart';
import 'package:supcar/model/userModel.dart';

class DoctorProfileController extends GetxController {
  var doctorData = Doctor(
    id: 0,
    userId: 0,
    certificatePhoto: '',
    profilePicture: '',
    clinicLocation: '',
    contactInformation: 0,
    specialization: '',
    user: User(
        id: 0,
        firstName: 'firstName',
        secondName: 'secondName',
        email: 'email',
        type: '',
        createdAt: DateTime.now()),
  ).obs;
  var isLoading = true.obs;
  TextEditingController contactInformationcontroller = TextEditingController();
  TextEditingController firstNamecontroller = TextEditingController();
  TextEditingController secondNamecontroller = TextEditingController();
  TextEditingController clinicLocationcontroller = TextEditingController();

  GlobalKey<FormState> formstate1 = GlobalKey();
  final dropDownKey = GlobalKey<DropdownSearchState>();
  var selectedValueSpecialites = ''.obs;

  var selectedValueCity = ''.obs;
  List<String> medicalSpecialties = [
    '40'.tr,
    '41'.tr,
    '42'.tr,
    '43'.tr,
    '44'.tr,
    '45'.tr,
    '46'.tr,
    '47'.tr,
    '48'.tr,
    '49'.tr,
    '50'.tr,
    '51'.tr,
    '52'.tr,
    '53'.tr,
    '54'.tr,
    '55'.tr,
    '56'.tr,
    '57'.tr,
    '58'.tr,
    '59'.tr,
    '60'.tr,
    '61'.tr,
    '62'.tr,
    '63'.tr,
    '64'.tr,
    '65'.tr,
    '66'.tr,
    '67'.tr,
    '68'.tr,
  ];
  List<String> medicalSpecialtiesEng = [
    'Anesthesia',
    'Emergency Medicine',
    'Family Medicine',
    'Internal Medicine',
    'Medical Genetics',
    'Neurology',
    'Obstetrics and Gynecology',
    'Ophthalmology',
    'Orthopedic Surgery',
    'Otolaryngology',
    'Pediatrics',
    'Psychiatry',
    'Radiology',
    'Surgery',
    'Urology',
    'Pathology',
    'Rehabilitation Medicine',
    'Preventive Medicine',
    'Public Health',
    'Allergy and Immunology',
    'Cardiology',
    'Endocrinology',
    'Gastroenterology',
    'Hematology',
    'Infectious Disease',
    'Nephrology',
    'Oncology',
    'Pulmonary Medicine',
    'Rheumatology',
    'Sports Medicine'
  ];

  String translateSpecialtyToEnglish(String arabicValue) {
    int index = medicalSpecialties.indexOf(arabicValue);
    if (index != -1) {
      return medicalSpecialtiesEng[index];
    }
    return arabicValue;
  }

  void setSelectedValueSpecialites(String? value) {
    selectedValueSpecialites.value = value!;
  }

  @override
  void onInit() {
    super.onInit();
    fetchDoctorDataFromApi();
    print('from controller ${doctorData.value.user.firstName}');
  }

  void fetchDoctorDataFromApi() async {
    try {
      isLoading(true);
      Doctor doc = await ApiService().fetchDoctorData();
      doctorData.value = doc;
      print('from controller ${doctorData.value.user.firstName}');
      contactInformationcontroller.text =
          doctorData.value.contactInformation.toString();
      firstNamecontroller.text = doctorData.value.user.firstName;
      secondNamecontroller.text = doctorData.value.user.secondName;
      clinicLocationcontroller.text = doctorData.value.clinicLocation;
      selectedValueSpecialites.value = doctorData.value.specialization;
      print("doctor Data: ${doctorData.value.user.firstName}");
    } catch (e) {
      print("Error fetching doctor data: $e");
    } finally {
      isLoading(false);
    }
  }

//تحديث بيانات المتطوعين
  void updateDoctorData() async {
    isLoading.value = true;
    String translatedSpecialty =
        translateSpecialtyToEnglish(selectedValueSpecialites.value);

    String url = '$serverLink$updateDoctorDataLink';
    print("URL: $url"); // طباعة الرابط

    if (formstate1.currentState != null &&
        formstate1.currentState!.validate()) {
      var requestBody = {
        'first_name': firstNamecontroller.text,
        'second_name': secondNamecontroller.text,
        'contact_information': contactInformationcontroller.text,
        'clinic_location': clinicLocationcontroller.text,
        'specialization': translatedSpecialty
      };
      print("Request Body: $requestBody"); // طباعة البيانات المرسلة

      var response = await ApiService().postRequest1(url, requestBody);
      isLoading.value = false;

      if (response != null &&
          response['message'] == 'Doctor and user data updated successfully') {
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
