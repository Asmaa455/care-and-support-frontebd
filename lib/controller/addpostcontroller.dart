// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';
import 'package:supcar/model/postModel.dart';

class AddPostController extends GetxController {
  var post = <Postmodel>[].obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  var isLoading = false.obs;
  GlobalKey<FormState> formstate1 = GlobalKey();
  int doctorId = 1;

  void createPost() async {
    // Logic to create a post
    isLoading.value = true;

    if (formstate1.currentState != null &&
        formstate1.currentState!.validate()) {
      String url = '$serverLink$createPostLink$doctorId';

      var response = await ApiService().postRequest1(url, {
        "doctor_id": doctorId.toString(),
        "category": categoryController.text,
        "title": titleController.text,
        "content": contentController.text,
      });
      isLoading.value = false;

      if (response != null &&
          response['message'] == 'post created successfully') {
        // categoryController.text = '';
        // titleController.text = '';
        // contentController.text = '';

        Get.offNamed('doctorhome');
      } else {
        print('Error: ${response['message']}');
      }
    } else {
      isLoading.value = false;
      print('Form validation failed');
    }
  }
}
