import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/controller/apiserves/apiserves.dart';
import 'package:supcar/model/postModel.dart';

class Mypostcontroller extends GetxController {
  var posts = <Postmodel>[].obs; // List of posts, observable
  var isLoading = false.obs;
  int doctorId = 1;
  // Example data for initial post

  @override
  void onInit() {
    super.onInit();
    postForDoctor();
  }

  void postForDoctor() async {
    String url = '$serverLink$doctorPostLink';
    try {
      isLoading(true);
      var fetchedUsers = await ApiService().fetchPostDoc(url, doctorId);
      posts.assignAll(fetchedUsers); // Update the observable list
    } finally {
      isLoading(false);
    }
  }
}
