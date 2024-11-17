import 'package:flutter/material.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/constent/stringtodata.dart';
import 'package:supcar/content/consultation.dart';
import 'package:supcar/content/crud.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';
import 'package:supcar/model/conModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Doctorask extends StatefulWidget {
  const Doctorask({super.key});

  @override
  State<Doctorask> createState() => _DoctorsearchState();
}

class _DoctorsearchState extends State<Doctorask> {
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
                child: Text(' مردود عليه'),
              ),
              Tab(
                child: Text('غير مردود عليه'),
              )
            ]),
          ),
          body: Container(
            child: TabBarView(
              children: [replayDone(), notReplay1()],
            ),
          ),
        ));
  }
}

class replayDone extends StatelessWidget with Crud {
  replayDone({
    super.key,
  });
  bool status = true;
  String? id;
  getreplayDone() async {
    var response = await getRequest(answeredConsultationsLink);
    
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: getreplayDone(),
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
                                    snapshot.data['consultation_text'][index])
                                .toString(),
                            username: 'username',
                            time: format.parse(Consultations.fromJson(
                                    snapshot.data['created_at'][index])
                                .toString()),
                            userImage: 'image/PI.jpeg'),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Icon(MyFlutterApp.reply),
                              ),
                              Post(
                                  messege: Consultations.fromJson(
                                          snapshot.data['answer_text'][index])
                                      .toString(),
                                  username: 'username',
                                  time: format.parse(Consultations.fromJson(
                                          snapshot.data['updated_at'][index])
                                      .toString()),
                                  userImage: 'image/PI.jpeg'),
                            ],
                          ),
                        )
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
        ),
      ),
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
