import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/content/post.dart';

class ViewPostForDoctorController extends GetxController {
  var posts = <Post>[].obs; // List of posts, observable

  // Example data for initial post
  var initialPost = Post(
    messege: Text('messege'),
    username: 'username',
    time: DateTime.now(),
    userImage: 'image/PI.jpeg',
  );

  @override
  void onInit() {
    super.onInit();
    // Initial data
    posts.add(initialPost);
  }

  void addPost(Post post) {
    posts.add(post);
  }
}
