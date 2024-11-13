import 'package:flutter/material.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/constent/link.dart';
import 'package:supcar/content/crud.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/content/valid.dart';

class Ask extends StatefulWidget {
  const Ask({super.key});

  @override
  State<Ask> createState() => _AskState();
}

class _AskState extends State<Ask> with Crud {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  TextEditingController typeOfConsultation = TextEditingController();
  TextEditingController content = TextEditingController();
  int id = 1;
  bool isloading = false;
  addNotea() async {
    isloading = true;
    setState(() {});
    if (formstate.currentState!.validate()) {
      var response = await getRequest(
        linkApi,
      );
      isloading = false;
      setState(() {});
      if (response['status'] == 'success') {
        Navigator.of(context).pushReplacementNamed('/Home');
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
              onPressed: () {},
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
