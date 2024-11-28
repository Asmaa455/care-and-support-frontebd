import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class Measure extends StatelessWidget {
  const Measure({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // استخدام Column لتحتوي Expanded بشكل صحيح
        children: [
          Expanded(
            // تضمين Expanded داخل Column
            child: Container(
              margin: EdgeInsets.all(10),
              child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 150,
                  ),
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed('bloodPressure');
                      },
                      child: Card(
                        color: Colors.red[200],
                        child: Container(
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
                    ),
                    InkWell(
                      onTap: () {},
                      child: Card(
                        color: Colors.blue[50],
                        child: Container(
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
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Icon(
                                  MyFlutterApp.nounDiabetesTest,
                                  size: 50,
                                  weight: 100,
                                  color: Colors.blue,
                                ),
                              ),
                              Text(
                                'Blood Sugar',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Card(
                        color: Colors.green[50],
                        child: Container(
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
                                  MyFlutterApp.nounMentalHealth,
                                  size: 50,
                                  weight: 100,
                                  color: Colors.green,
                                ),
                              ),
                              Text(
                                'Blood ',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Card(
                        color: Colors.yellow[50],
                        child: Container(
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
                                  MyFlutterApp.nounWeight,
                                  size: 50,
                                  weight: 100,
                                  color: Colors.yellow,
                                ),
                              ),
                              Text(
                                'Weight',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
