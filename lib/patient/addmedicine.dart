import 'package:flutter/material.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/constent/stringtodata.dart';
import 'package:supcar/content/convert_time.dart';
import 'package:supcar/content/form.dart';
import 'package:supcar/content/valid.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class Addmedicine extends StatefulWidget {
  const Addmedicine({super.key});

  @override
  State<Addmedicine> createState() => _AddmedicineState();
}

class _AddmedicineState extends State<Addmedicine> {
  TextEditingController medicineName = TextEditingController();
  TextEditingController dosageAmount = TextEditingController();
  String? amount;
  Future<TimeOfDay?> _selectedTime() async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _time);

    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
        _ckicked = true;
      });
    }

    return picked;
  }

  DateTime _dateFirst = DateTime(2024, 1, 1);
  DateTime _dateLast = DateTime(2024, 12, 1);
  bool _clickedDate = false;

  Future<DateTime?> _firstSelectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dateFirst,
      firstDate: _dateFirst,
      lastDate: _dateLast,
    );

    if (picked != null && picked != _dateFirst) {
      setState(() {
        _dateFirst = picked;
        _clickedDate = true;
      });
    }

    return picked;
  }

  bool _lastClickedDate = false;

  Future<DateTime?> _lastSelectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dateFirst,
      firstDate: _dateFirst,
      lastDate: _dateLast,
    );

    if (picked != null && picked != _dateFirst) {
      setState(() {
        _dateLast = picked;
        _lastClickedDate = true;
      });
    }

    return picked;
  }

  bool _ckicked = false;
  TimeOfDay _time = const TimeOfDay(hour: 0, minute: 00);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(
          MyFlutterApp.noun_medicine_7230298,
          color: lightPink,
        ),
        backgroundColor: deepPurple,
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, top: 5),
              child: Text(
                'Medicine Name',
                style: TextStyle(
                    color: deepPurple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Form1(
                hint1: 'Medicine Name',
                mycontroller: medicineName,
                valid: (val) {
                  return vaidInput(val!, 5, 20);
                },
                max: 1),
            Container(
              padding: EdgeInsets.only(left: 20, top: 5),
              child: Text(
                'Dosage amount',
                style: TextStyle(
                    color: deepPurple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Form1(
                hint1: 'Dosage amount',
                mycontroller: dosageAmount,
                valid: (val) {
                  return vaidInput(val!, 5, 20);
                },
                max: 1),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 5),
                    child: Text(
                      'Daily repetition',
                      style: TextStyle(
                          color: deepPurple,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  DropdownButton(
                    items: ['1', '2', '3', '4']
                        .map((e) => DropdownMenuItem(
                              child: Text('$e'),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        amount = val;
                      });
                    },
                    value: amount,
                  )
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, top: 5),
                  child: Text(
                    'Starting Time',
                    style: TextStyle(
                        color: deepPurple,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(padding: EdgeInsets.all(20)),
                Container(
                  decoration: BoxDecoration(
                      color: pink,
                      border: Border.all(color: deepPurple),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextButton(
                      onPressed: () {
                        _selectedTime();
                      },
                      child: Text(_clickedDate
                          ? '${convertTime(_time.hour.toString())}:${convertTime(_time.minute.toString())}'
                          : 'Select Time')),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, top: 5),
                  child: Text(
                    'Starting Date',
                    style: TextStyle(
                        color: deepPurple,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(padding: EdgeInsets.all(20)),
                Container(
                  decoration: BoxDecoration(
                      color: pink,
                      border: Border.all(color: deepPurple),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextButton(
                      onPressed: () {
                        _firstSelectDate(context);
                      },
                      child: Text(_ckicked
                          ? '${_dateFirst.toString()}'
                          : 'Select Time')),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, top: 5),
                  child: Text(
                    'Ending Date',
                    style: TextStyle(
                        color: deepPurple,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(padding: EdgeInsets.all(20)),
                Container(
                  decoration: BoxDecoration(
                      color: pink,
                      border: Border.all(color: deepPurple),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextButton(
                      onPressed: () {
                        _lastSelectDate(context);
                      },
                      child: Text(_lastClickedDate
                          ? '${_dateFirst.toString()}'
                          : 'Select Time')),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
  // Column(
            //   children: [
            //     RadioListTile(
            //         activeColor: lightPink,
            //         title: Text('1'),
            //         value: '1',
            //         groupValue: amount,
            //         onChanged: (val) {
            //           setState(() {
            //             amount = val;
            //           });
            //         }),
            //     RadioListTile(
            //         activeColor: lightPink,
            //         title: Text('2'),
            //         value: '2',
            //         groupValue: amount,
            //         onChanged: (val) {
            //           setState(() {
            //             amount = val;
            //           });
            //         }),
            //     RadioListTile(
            //         activeColor: lightPink,
            //         title: Text('3'),
            //         value: '3',
            //         groupValue: amount,
            //         onChanged: (val) {
            //           setState(() {
            //             amount = val;
            //           });
            //         }),
            //     RadioListTile(
            //         activeColor: lightPink,
            //         title: Text('4'),
            //         value: '4',
            //         groupValue: amount,
            //         onChanged: (val) {
            //           setState(() {
            //             amount = val;
            //           });
            //         }),

            //   ],
            // )