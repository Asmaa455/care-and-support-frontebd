import 'package:flutter/material.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/consultation.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class Doctorsearch extends StatefulWidget {
  const Doctorsearch({super.key});

  @override
  State<Doctorsearch> createState() => _DoctorsearchState();
}

class _DoctorsearchState extends State<Doctorsearch> {
  bool? status = true;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed('ask');
            },
            child: Icon(Icons.add),
          ),
          appBar: AppBar(
            backgroundColor: pink,
            toolbarHeight: 0,
            bottom: TabBar(tabs: [
              Tab(
                child: ListView(),
              ),
              Tab(
                child: Text('غير مردود عليه'),
              )
            ]),
          ),
          body: Container(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Post(
                    messege: 'messege',
                    username: 'username',
                    time: DateTime.now(),
                    userImage: 'image/PI.jpeg'),
                Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.all(10),
                  child: status != true
                      ? Icon(
                          MyFlutterApp.comment_empty,
                          color: deepPurple,
                        )
                      : Icon(
                          MyFlutterApp.comment,
                          color: deepPurple,
                        ),
                ),
                status == true
                    ? Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(MyFlutterApp.reply),
                            ),
                            Post(
                                messege: 'messege',
                                username: 'username',
                                time: DateTime.now(),
                                userImage: 'image/PI.jpeg'),
                          ],
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ));
  }
}
