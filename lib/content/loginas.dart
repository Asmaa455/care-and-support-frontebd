import 'package:flutter/material.dart';
import 'package:supcar/constent/color.dart';

class Loginas extends StatefulWidget {
  const Loginas({super.key});

  @override
  State<Loginas> createState() => _LoginasState();
}

class _LoginasState extends State<Loginas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: deepPurple,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('doctorhome');
                  },
                  child: Text('SignUp As Doctor')),
            ),
            Container(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('home');
                  },
                  child: Text('SignUp As Patient')),
            ),
            Container(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('volunteerhome');
                  },
                  child: Text('SignUp As volunteer')),
            )
          ],
        ),
      ),
    );
  }
}
