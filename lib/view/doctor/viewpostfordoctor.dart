import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/controller/viewpostfordoctor.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class Viewpostfordoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ViewPostForDoctorController controller =
        Get.put(ViewPostForDoctorController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: lightPink,
        onPressed: () {
          Navigator.of(context).pushNamed('addpost');
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Obx(
          () => ListView.builder(
            itemCount: controller.posts.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: lightPink),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: controller.posts[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
