import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/content/valid.dart';
import 'package:supcar/controller/addpostcontroller.dart';

class Addpost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AddPostController controller = Get.put(AddPostController());

    return Scaffold(
      appBar: AppBar(
        title: Icon(
          Icons.post_add,
          color: lightPink,
        ),
        centerTitle: true,
        backgroundColor: deepPurple,
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                Form1(
                  hint1: ' write post',
                  mycontroller: controller.postController,
                  valid: (val) {
                    return vaidInput(val!, 10, 1000);
                  },
                  max: 15,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: deepPurple),
                    borderRadius: BorderRadius.circular(15),
                    color: pink,
                  ),
                  child: TextButton(
                    onPressed: () {
                      controller.createPost();
                    },
                    child: Text("create post"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
