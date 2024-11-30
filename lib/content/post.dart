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
      this.iddoctor,
      this.leading});
  final Widget messege;
  final String username;
  final DateTime time;
  final String userImage;
  int? iddoctor;
  Widget? leading;

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
                leading: leading),
          ],
        ),
      );
    }

    buildPostFooter() {
      return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          alignment: Alignment.topRight,
          padding: EdgeInsets.all(5),
          child: messege,
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
