import 'package:flutter/material.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/content/valid.dart';

class Replayhelp extends StatefulWidget {
  const Replayhelp({super.key});

  @override
  State<Replayhelp> createState() => _ReplayhelpState();
}

class _ReplayhelpState extends State<Replayhelp> {
  TextEditingController help = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(
          Icons.volunteer_activism,
          color: lightPink,
        ),
        centerTitle: true,
        backgroundColor: deepPurple,
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                Form1(
                    hint1: 'Repaly To Help',
                    mycontroller: help,
                    valid: (val) {
                      return vaidInput(val!, 5, 1000);
                    },
                    max: 15),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: deepPurple),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Replay Help",
                      style: TextStyle(
                          color: deepPurple, fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(pink)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
