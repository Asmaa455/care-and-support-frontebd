import 'package:flutter/material.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/content/crud.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/content/valid.dart';
import 'package:supcar/model/conModel.dart';

class Ask extends StatefulWidget {
  const Ask({super.key});

  @override
  State<Ask> createState() => _AskState();
}

class _AskState extends State<Ask> with Crud {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  TextEditingController typeOfConsultation = TextEditingController();
  TextEditingController content = TextEditingController();
  Consultation1 consultation1 = Consultation1();
  int id = 1;
  int patientId = 1;

  bool isloading = false;
  addConsultation() async {
    isloading = true;
    setState(() {});
    if (formstate.currentState!.validate()) {
      var response = await postRequest(linkApi, {
        "patientId": patientId.toString(),
        "consultationText": content.text,
        "updatedAt": DateTime.now().toIso8601String(),
        "createdAt": DateTime.now().toIso8601String(),
        "id": id.toString()
      });
      isloading = false;
      setState(() {});
      if (response['status'] == 'success') {
        Navigator.of(context).pushNamed('doctorask');
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ask Doctor',
          style: TextStyle(color: lightPink),
        ),
        backgroundColor: deepPurple,
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: [
            Form1(
              hint1: 'Title',
              max: 1,
              mycontroller: typeOfConsultation,
              valid: (val) {
                return vaidInput(val!, 5, 20);
              },
            ),
            Form1(
              max: 15,
              hint1: 'Write Your Consultation',
              mycontroller: content,
              valid: (val) {
                return vaidInput(val!, 40, 1000);
              },
            ),
            TextButton(
              onPressed: addConsultation(),
              child: Text('Send Consultation'),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(pink),
              ),
            )
          ],
        ),
      ),
    );
  }
}
