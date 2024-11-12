import 'package:flutter/material.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/content/valid.dart';

class Addpost extends StatefulWidget {
  const Addpost({super.key});

  @override
  State<Addpost> createState() => _AddpostState();
}

class _AddpostState extends State<Addpost> {
  TextEditingController post = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    mycontroller: post,
                    valid: (val) {
                      vaidInput(val!, 10, 1000);
                    },
                    max: 15),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: deepPurple),
                    borderRadius: BorderRadius.circular(15),
                    color: pink,
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text("create post"),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
