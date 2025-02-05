import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';
import 'package:supcar/model/userModel.dart';
import 'package:supcar/model/volunteersModel.dart';

class VolunteerProfileController extends GetxController {
  var volunteerData = Volunteersmodel(
    id: 0,
    userId: 0,
    contactInformation: 0,
    nationalNumber: 0,
    profilePicture: '',
    createdAt: DateTime.now(),
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
  GlobalKey<FormState> formstate1 = GlobalKey();
  @override
  void onInit() {
    super.onInit();
    fetchVolunteerDataFromApi();
  }

  void fetchVolunteerDataFromApi() async {
    try {
      isLoading(true);
      Volunteersmodel vol = await ApiService().fetchVolunteerData();
      volunteerData.value = vol;

      contactInformationcontroller.text =
          volunteerData.value.contactInformation.toString();
      firstNamecontroller.text = volunteerData.value.user.firstName;
      secondNamecontroller.text = volunteerData.value.user.secondName;
      print("Volunteer Data: ${volunteerData.value.user.firstName}");
    } catch (e) {
      print("Error fetching volunteer data: $e");
    } finally {
      isLoading(false);
    }
  }

//تحديث بيانات المتطوعين
  void updateVolunteerData() async {
    isLoading.value = true;
    String url = '$serverLink$updateVolunteerDataLink';
    print("URL: $url"); // طباعة الرابط

    if (formstate1.currentState != null &&
        formstate1.currentState!.validate()) {
      var requestBody = {
        'first_name': firstNamecontroller.text,
        'second_name': secondNamecontroller.text,
        'contact_information': contactInformationcontroller.text
      };
      print("Request Body: $requestBody"); // طباعة البيانات المرسلة

      var response = await ApiService().postRequest1(url, requestBody);
      isLoading.value = false;

      if (response != null &&
          response['message'] ==
              'Volunteer and user data updated successfully') {
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
