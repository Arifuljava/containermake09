

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
      maxLines: 2,
      keyboardType: TextInputType.multiline, textInputAction: TextInputAction.newline,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter Value',
        hintText: "Enter Value",
      ),
      controller: mycontroller,
    );

    AlertDialog alertDialog = AlertDialog(

      content: Container(
        height: 50,
          width: 300,
          child: textField),

      actions: [
        ElevatedButton(
          child: Text('Confirm'),
          onPressed: () {
            // Perform actions when the user taps the OK button
            if(mycontroller.text==""|| mycontroller.text==null)
              {
                print("No data found");
              }
            else{
              print("Text : "+mycontroller.text);
              mycontroller.text =  "";
              Navigator.pop(context);
            }


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