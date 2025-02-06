import 'package:dropdown_search/dropdown_search.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';
import 'package:supcar/model/doctorModel.dart';

class Doctorsearchcontroller extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController specialty = TextEditingController();

  var alldoctor = <Doctor>[].obs;

  // قائمة المدن بالإنجليزية والعربية
  var city = [
    '32'.tr,
    '33'.tr,
    '34'.tr,
    '35'.tr,
    '36'.tr,
    '37'.tr,
    '38'.tr,
    '39'.tr,
  ].obs;

  var cityEng = [
    'Damascus',
    'Aleppo',
    'Homs',
    'Idlib',
    'Raqqa',
    'Deir ez-Zor',
    'Latakia',
    'Tadmor',
  ].obs;

  // قائمة التخصصات بالإنجليزية والعربية
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

  var selectedValuelocation = ''.obs;
  var selectedValueSpecialites = ''.obs;
  var filteredSpecialties = <String>[].obs;
  var searchQuery = ''.obs;
  final dropDownKey = GlobalKey<DropdownSearchState>();
  var isLoading = true.obs;

  void setSelectedValue(String? value) {
    selectedValuelocation.value = value!;
  }

  void setSelectedValueSpecialites(String? value) {
    selectedValueSpecialites.value = value!;
  }

  // ترجمة القيم المختارة إلى الإنجليزية
  String translateCityToEnglish(String arabicValue) {
    int index = city.indexOf(arabicValue);
    if (index != -1) {
      return cityEng[index];
    }
    return arabicValue;
  }

  String translateSpecialtyToEnglish(String arabicValue) {
    int index = medicalSpecialties.indexOf(arabicValue);
    if (index != -1) {
      return medicalSpecialtiesEng[index];
    }
    return arabicValue;
  }

  fetchAllDoctor() async {
    try {
      isLoading(true);
      var fetchDoctor = await ApiService().fetchDoctor();
      print(fetchDoctor);
      alldoctor.assignAll(fetchDoctor);
      print(alldoctor[0].profilePicture);
    } finally {
      isLoading(false);
    }
  }

  fetchSearchDoctor() async {
    try {
      isLoading(true);

      // ترجمة المدخلات إلى الإنجليزية قبل البحث
      String translatedLocation =
          translateCityToEnglish(selectedValuelocation.value);
      String translatedSpecialty =
          translateSpecialtyToEnglish(selectedValueSpecialites.value);

      var fetchDoctor = await ApiService()
          .searchDoctor(name.text, translatedLocation, translatedSpecialty);
      print(fetchDoctor);
      alldoctor.assignAll(fetchDoctor);
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchAllDoctor();
  }
}
