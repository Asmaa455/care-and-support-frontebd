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
            Form(
              key: controller.formstate1,
              child: Column(
                children: [
                  Form1(
                    lebal: '104'.tr,
                    mycontroller: controller.titleController,
                    valid: (val) {
                      return Valid().vaidInput(val!, 0, 200);
                    },
                    max: 1,
                  ),
                  Form1(
                    lebal: '105'.tr,
                    mycontroller: controller.contentController,
                    valid: (val) {
                      return Valid().vaidInput(val!, 10, 1000);
                    },
                    max: 10,
                  ),
                  Form1(
                    lebal: '106'.tr,
                    mycontroller: controller.categoryController,
                    valid: (val) {
                      return Valid().vaidInput(val!, 0, 1000);
                    },
                    max: 1,
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
                        if (controller.formstate1.currentState?.validate() ??
                            false) {
                          controller.createPost();
                        } else {
                          print('Form validation failed');
                        }
                      },
                      child: Text("107".tr),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
