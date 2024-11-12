import 'package:flutter/material.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class Showhelp extends StatefulWidget {
  const Showhelp({super.key});

  @override
  State<Showhelp> createState() => _ShowhelpState();
}

class _ShowhelpState extends State<Showhelp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView(scrollDirection: Axis.vertical, children: [
      Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: lightPink),
            borderRadius: BorderRadius.circular(25)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Container(
            child: Post(
                messege: 'messege',
                username: 'username',
                time: DateTime.now(),
                userImage: 'image/PI.jpeg'),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('replayhelp');
              },
              icon: Icon(MyFlutterApp.comment))
        ]),
      )
    ])));
  }
}
