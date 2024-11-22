import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPostController extends GetxController {
  var post = ''.obs;
  TextEditingController postController = TextEditingController();

  void createPost() {
    // Logic to create a post
    if (post.isNotEmpty) {
      print("Post created: ${post.value}");
      // Add more logic here if needed
    }
  }
}
