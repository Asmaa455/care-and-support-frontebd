import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:supcar/controller/Measurecontroller.dart';
import 'package:supcar/model/healthyValueModel.dart';

class CustomGrid extends StatelessWidget {
  CustomGrid({
    super.key,
    required this.controller,
    required this.color,
    required this.borderColor,
    required this.iconColor,
    required this.itemCount,
    required this.icon,
    required this.pressure,
  });

  final Measurecontroller controller;
  final Color color;
  final Color borderColor;
  final Color iconColor;
  final int itemCount;
  final IconData icon;
  var pressure = <Healthyvaluemodel>[];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisExtent: 120,
      ),
      itemCount: itemCount,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Card(
          color: color,
          child: Container(
            height: 100,
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: borderColor,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    icon,
                    size: 50,
                    color: iconColor,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '91'.tr + ': ${pressure[index].value}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '92'.tr + ': ${pressure[index].status}',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '93'.tr +
                          ': ${DateFormat('HH:mm').format(pressure[index].createAt)}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
