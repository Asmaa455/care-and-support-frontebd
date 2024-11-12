import 'package:flutter/material.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class Medicine extends StatefulWidget {
  const Medicine({super.key});

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: GridView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 200,
        ),
        children: [
          InkWell(
            onTap: () {},
            child: Card(
              color: lightPink,
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 247, 244, 245),
                          ),
                          borderRadius: BorderRadius.circular(100)),
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Icon(
                        MyFlutterApp.noun_medicine_7230298,
                        size: 50,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListTile(
                        title: Text(
                          'Name of Medicine',
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Text(
                          'description',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Icon(
                    MyFlutterApp.noun_medicine_7230298,
                    size: 100,
                  ),
                  Expanded(
                    flex: 2,
                    child: ListTile(
                      title: Text('Name of Medicine'),
                      subtitle: Text('description'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
