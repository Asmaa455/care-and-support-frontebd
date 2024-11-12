import 'package:flutter/material.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/main.dart';

class Post extends StatelessWidget {
  Post(
      {super.key,
      required this.messege,
      required this.username,
      required this.time,
      required this.userImage,
      this.iddoctor});
  final String messege;
  final String username;
  final DateTime time;
  final String userImage;
  int? iddoctor;

  @override
  Widget build(BuildContext context) {
    buildPostHeader() {
      return Container(
        alignment: Alignment.topRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
                trailing: CircleAvatar(
                  backgroundImage: AssetImage(userImage),
                  backgroundColor: Colors.grey,
                ),
                title: GestureDetector(
                  onTap: () {},
                  child: Text(
                    username,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      time.toString(),
                      textAlign: TextAlign.right,
                    ),
                    Container(padding: EdgeInsets.all(5)),
                    Icon(
                      Icons.watch_later_outlined,
                      size: 15,
                    ),
                  ],
                ),
                leading: PopupMenuButton(
                    itemBuilder: (context) => [
                          sharedPref.getString('id') == iddoctor.toString()
                              ? PopupMenuItem(
                                  child: TextButton(
                                  child: Text('Edit'),
                                  onPressed: () {},
                                ))
                              : PopupMenuItem(child: Container())
                        ])),
          ],
        ),
      );
    }

    buildPostFooter() {
      return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          alignment: Alignment.topRight,
          padding: EdgeInsets.all(5),
          child: Text(
            messege,
            textAlign: TextAlign.justify,
          ),
        ),
      ]);
    }

    return Container(
      child: Column(
        children: [
          buildPostHeader(),
          buildPostFooter(),
        ],
      ),
    );
  }
}
