import 'package:flutter/material.dart';
import 'package:supcar/constent/color.dart';

class Form1 extends StatelessWidget {
  final String? hint1;
  final String? Function(String?) valid;
  final TextEditingController mycontroller;
  final int max;
  final String? lebal;
  FocusNode? focusNode;
  Form1(
      {super.key,
      this.hint1,
      required this.mycontroller,
      required this.valid,
      required this.max,
      this.focusNode,
      this.lebal});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: pink,
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(top: 10, left: 4, right: 4),
      child: TextFormField(
        focusNode: focusNode,
        maxLines: max,
        validator: valid,
        controller: mycontroller,
        decoration: lebal == null
            ? InputDecoration(
                hintText: hint1,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(),
                ))
            : InputDecoration(
                label: Text(lebal!),
                hintText: hint1,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(),
                )),
      ),
    );
  }
}
