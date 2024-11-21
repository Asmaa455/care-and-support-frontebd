import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  Consultations consultation1 = Consultations();
  int id = 1;
  int patientId = 1;

  bool isloading = false;
  addConsultation() async {
    isloading = true;
    setState(() {});
    if (formstate.currentState!.validate()) {
      const String createConsultationLink =
          "Medical_Consultation/patient_consultation_store/";
      String url = linkForGetWithId(createConsultationLink, id.toString());
      var response = await postRequest(url, {
        "patientId": patientId.toString(),
        "consultationText": content.text,
        "updatedAt": null,
        "createdAt": DateTime.now().toIso8601String(),
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
              max: 15,
              hint1: 'Write Your Consultation',
              mycontroller: content,
              valid: (val) {
                return vaidInput(val!, 40, 1000);
              },
            ),
            TextButton(
              onPressed: () async {
                await addConsultation();
              },
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
