import 'package:flutter/material.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/content/crud.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/content/valid.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';
import 'package:supcar/model/conModel.dart';

class Consultation extends StatefulWidget {
  final cconsultation;
  const Consultation({super.key, this.cconsultation});

  @override
  State<Consultation> createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> with Crud {
  TextEditingController replay = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();
  bool isloading = false;

  @override
  void initState() {
    super.initState();
  }

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

class notReplay1 extends StatefulWidget {
  notReplay1({super.key});

  @override
  State<notReplay1> createState() => _notReplay1State();
}

class _notReplay1State extends State<notReplay1> with Crud {
  String id = '1';

  Consultations consultations = Consultations();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: FutureBuilder(
        future: getMedicalConsultation(unansweredConsultationsLink, id),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data['consultations'].length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Post(
                          messege: Consultations.fromJson(
                                  snapshot.data['consultations'][index]
                                      ['consultationText'])
                              .toString(),
                          username: 'username',
                          time: DateTime.now(),
                          userImage: 'image/PI.jpeg'),
                      Container(
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.all(10),
                          child: Icon(
                            MyFlutterApp.comment_empty,
                            color: deepPurple,
                          )),
                    ],
                  ),
                );
              },
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('loading'),
            );
          }
          return Center(
            child: Text('loading'),
          );
        },
      )),
    );
  }
}
