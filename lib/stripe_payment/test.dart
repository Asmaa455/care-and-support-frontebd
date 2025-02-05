import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('TextField with DropdownButton')),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  String? selectedValue;
  final List<String> dropdownItems = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Other'
  ];
  final TextEditingController _controller = TextEditingController();
  bool isOtherSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Enter text',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          DropdownButton<String>(
            value: selectedValue,
            hint: Text('Select an option'),
            items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue;
                if (newValue == 'Other') {
                  isOtherSelected = true;
                  _controller.text = '';
                } else {
                  isOtherSelected = false;
                  _controller.text = newValue!;
                }
              });
            },
          ),
          SizedBox(height: 16.0),
          if (isOtherSelected)
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter custom option',
                border: OutlineInputBorder(),
              ),
              onChanged: (String newValue) {
                setState(() {
                  selectedValue = newValue;
                });
              },
            ),
        ],
      ),
    );
  }
}
