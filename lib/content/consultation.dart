import 'package:flutter/material.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/content/valid.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class Consultation extends StatelessWidget {
  Consultation({super.key});

  TextEditingController replay = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void showDialogConsulation() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Reply to the consultation"),
          content: Form1(
            hint1: "write",
            max: 10,
            mycontroller: replay,
            valid: (val) {
              return vaidInput(val!, 5, 1000);
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('cancel'),
            ),
            TextButton(onPressed: () {}, child: Text('add replay'))
          ],
        ),
      );
    }

    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: deepPurple),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Post(
                  messege: 'messege',
                  username: 'username',
                  time: DateTime.now(),
                  userImage: 'image/PI.jpeg'),
              IconButton(
                  onPressed: () {
                    showDialogConsulation();
                  },
                  icon: Icon(MyFlutterApp.comment_empty)),
            ],
          )),
    );
  }
}
