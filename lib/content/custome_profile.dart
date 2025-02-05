import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';

class CustomeProfile extends StatelessWidget {
  CustomeProfile(
      {super.key,
      required this.image,
      required this.fristName,
      required this.secondName,
      required this.speciality,
      required this.contactInformation,
      this.clinicLocation});
  final String image;
  final String fristName;
  final String secondName;
  final Widget speciality;
  final Widget contactInformation;
  Widget? clinicLocation;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 65,
          backgroundImage: AssetImage(image),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 40,
                margin: EdgeInsets.only(top: 10, right: 15, left: 15),
                padding: EdgeInsets.only(right: 10, left: 10),
                decoration: BoxDecoration(
                    color: pink,
                    border: Border.all(color: deepPurple),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Text(
                      '${'126'.tr}: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: deepPurple, fontWeight: FontWeight.bold),
                    ),
                    Text('$fristName $secondName')
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                  height: 40,
                  margin: EdgeInsets.only(top: 10, right: 15, left: 15),
                  padding: EdgeInsets.only(right: 10, left: 10),
                  decoration: BoxDecoration(
                      color: pink,
                      border: Border.all(color: deepPurple),
                      borderRadius: BorderRadius.circular(15)),
                  child: speciality),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                  height: 40,
                  margin: EdgeInsets.only(top: 10, right: 15, left: 15),
                  padding: EdgeInsets.only(right: 10, left: 10),
                  decoration: BoxDecoration(
                      color: pink,
                      border: Border.all(color: deepPurple),
                      borderRadius: BorderRadius.circular(15)),
                  child: contactInformation),
            ),
            // Container(
            //     margin: EdgeInsets.only(right: 20), child: Icon(Icons.edit))
          ],
        ),
        clinicLocation != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                        height: 40,
                        margin: EdgeInsets.only(top: 10, right: 15, left: 15),
                        padding: EdgeInsets.only(right: 10, left: 10),
                        decoration: BoxDecoration(
                            color: pink,
                            border: Border.all(color: deepPurple),
                            borderRadius: BorderRadius.circular(15)),
                        child: clinicLocation),
                  ),
                ],
              )
            : Container()
      ],
    );
  }
}
