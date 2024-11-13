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
      backgroundColor: deepPurple,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              loginAsContainar(
                onPressed: () {
                  Navigator.of(context).pushNamed('doctorhome');
                },
                title: 'SignUp As Doctor',
              ),
              loginAsContainar(
                  onPressed: () {
                    Navigator.of(context).pushNamed('home');
                  },
                  title: 'SignUp As Patient'),
              loginAsContainar(
                  onPressed: () {
                    Navigator.of(context).pushNamed('volunteerhome');
                  },
                  title: 'SignUp As volunteer'),
            ],
          ),
        ),
      ),
    );
  }
}

class loginAsContainar extends StatelessWidget {
  const loginAsContainar(
      {super.key, required this.onPressed, required this.title});
  final void Function() onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      width: 100,
      alignment: Alignment.center,
      child: TextButton(onPressed: onPressed, child: Text(title)),
      decoration: BoxDecoration(
          color: lightPink,
          border: Border.all(color: deepPurple),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
