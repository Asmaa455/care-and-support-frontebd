import 'package:flutter/material.dart';
import 'package:supcar/constent/color.dart';

class EventCarde extends StatelessWidget {
  const EventCarde({super.key, required this.isPast, required this.child});
  final bool isPast;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: isPast ? lightPink : pink,
          border: Border.all(color: deepPurple),
          borderRadius: BorderRadius.circular(15)),
      child: child,
    );
  }
}
