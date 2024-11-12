import 'package:flutter/material.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  bool? status = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help',
          style: TextStyle(color: lightPink, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: deepPurple,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('addhelp');
        },
        child: Icon(Icons.add),
        backgroundColor: lightPink,
      ),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: lightPink),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    child: Post(
                        messege: 'messege',
                        username: 'username',
                        time: DateTime.now(),
                        userImage: 'image/PI.jpeg'),
                  ),
                  Container(
                    height: 20,
                  ),
                  Container(
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
                                child: Icon(
                                  MyFlutterApp.reply,
                                  color: lightPink,
                                ),
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
          ],
        ),
      ),
    );
  }
}
