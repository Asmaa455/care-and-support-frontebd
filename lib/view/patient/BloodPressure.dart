import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/constent/stringtodata.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class Bloodpressure extends StatelessWidget {
  const Bloodpressure({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Icon(
            MyFlutterApp.nounBloodPressure,
            color: lightPink,
            weight: 2,
            size: 50,
          ),
          backgroundColor: deepPurple,
          centerTitle: true,
        ),
        body: Column(children: [
          Container(
            height: 20,
          ),
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime(2020, 1, 1),
            lastDate: DateTime(9999, 12, 31),
            onDateSelected: (date) {},
            leftMargin: 20,
            monthColor: Colors.blueGrey,
            dayColor: deepPurple,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: lightPink,
            dotColor: Color(0xFF333A47),
            selectableDayPredicate: (date) => date.day != 23,
            locale: 'en_ISO',
          ),
          Card(
            color: Colors.red[200],
            child: Container(
              height: 100,
              padding: EdgeInsets.only(left: 10, right: 10),
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
                          color: deepPurple,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(
                      MyFlutterApp.nounBloodPressure,
                      size: 50,
                      weight: 100,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    'Blood Pressure',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
