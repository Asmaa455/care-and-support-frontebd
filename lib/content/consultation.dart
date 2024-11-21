import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/content/crud.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/content/valid.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';
import 'package:supcar/model/conModel.dart';
import 'package:http/http.dart' as http;

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
  int id = 1;
  int? patientId;
  int doctorId = 1;
  getNotReplay(int id) async {
    String myUrl =
        'https://d7f3-5-0-138-106.ngrok-free.app/Medical_Consultation/Unanswered_Medical_Consultations/$id';
    try {
      var response = await http.get(Uri.parse(myUrl));
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print('ERROR ${response.statusCode}');
      }
    } catch (e) {
      print('ERROR CATCH $e');
    }
  }

  replayConsultation(int patientId, int doctorId) async {
    isloading = true;
    setState(() {});
    if (formstate.currentState!.validate()) {
      const String createConsultationLink =
          "https://d7f3-5-0-138-106.ngrok-free.app/Medical_Consultation/doctor_answer_create/store/";
      String url = linkForGetWithId(createConsultationLink, id.toString());
      var response = await postRequest(url, {
        "patientId": patientId.toString(),
        "answer_text": replay.text,
        "updatedAt": DateTime.now().toIso8601String(),
      });
      isloading = false;
      setState(() {});
      if (response['status'] == 'success') {
        Navigator.of(context).pushReplacementNamed('consultation');
      } else {}
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    showDialogConsulation(int patientId) {
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
            TextButton(
                onPressed: replayConsultation(patientId, doctorId),
                child: Text('add replay'))
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
          child: FutureBuilder(
            future: getNotReplay(id),
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
                              child: IconButton(
                                icon: Icon(
                                  MyFlutterApp.comment_empty,
                                ),
                                color: deepPurple,
                                onPressed: showDialogConsulation(
                                    snapshot.data['consultations'][index]
                                        ['patient_id']),
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

class notReplay1 extends StatefulWidget {
  notReplay1({super.key});

  @override
  State<notReplay1> createState() => _notReplay1State();
}

class _notReplay1State extends State<notReplay1> with Crud {
  int patientId = 1;

  Consultations consultations = Consultations();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: FutureBuilder(
        future: getMedicalConsultation(unansweredConsultationsLink, patientId),
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
                          child: IconButton(
                            icon: Icon(
                              MyFlutterApp.comment_empty,
                            ),
                            color: deepPurple,
                            onPressed: () {},
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
