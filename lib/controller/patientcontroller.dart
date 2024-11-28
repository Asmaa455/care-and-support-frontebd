import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/content/post.dart';

class HomePatientController extends GetxController {
  var posts = <Post>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initial data
    var initialPost = Post(
      messege: Text('messege'),
      username: 'username',
      time: DateTime.now(),
      userImage: 'image/PI.jpeg',
    );
    posts.add(initialPost);
  }
}
