import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';
import 'package:supcar/model/postModel.dart';

class HomePatientController extends GetxController {
  var posts = <Postmodel>[].obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    postForDoctor();
    // Initial data
  }

  Future<void> reFresh() async {
    postForDoctor();
  }

  void postForDoctor() async {
    String url = '$serverLink$postLink';
    print(url);
    try {
      isLoading(true);
      var fetchedUsers = await ApiService().fetchPost(url);
      print(fetchedUsers);
      posts.assignAll(fetchedUsers); // Update the observable list
    } finally {
      isLoading(false);
    }
  }
}
