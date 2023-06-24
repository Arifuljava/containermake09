

import 'package:flutter/material.dart';

class alertwithedit extends StatefulWidget {
  const alertwithedit({super.key});

  @override
  State<alertwithedit> createState() => _alertwitheditState();
}

class _alertwitheditState extends State<alertwithedit> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  TextEditingController mycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextField textField = TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter Value',
        hintText: "Enter Value",
      ),
      controller: mycontroller,
    );

    AlertDialog alertDialog = AlertDialog(

      content: textField,
      actions: [
        ElevatedButton(
          child: Text('Confirm'),
          onPressed: () {
            // Perform actions when the user taps the OK button
            print("Text : "+mycontroller.text);
          },
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Alert Dialog'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Show Alert Dialog'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return alertDialog;
              },
            );
          },
        ),
      ),
    );
  }
}