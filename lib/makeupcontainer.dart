



import 'package:flutter/material.dart';

class makeupcontainer extends StatefulWidget {
  const makeupcontainer({super.key});

  @override
  State<makeupcontainer> createState() => _makeupcontainerState();
}

class _makeupcontainerState extends State<makeupcontainer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Container Make Up"),

        ),
        body: Center(
          child: Container(
            color: Colors.blue, // Outer container color
            width: 200,
            height: 200,
            alignment: Alignment.center,
            child: Container(
              color: Colors.red, // Inner container color
              width: 100,
              height: 100,
              child: Text(
                'Inner Container',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

        ),
      ),
    );
  }
}
