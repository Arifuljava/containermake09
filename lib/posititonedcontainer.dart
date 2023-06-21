



import 'package:flutter/material.dart';

class posititonedcontainer extends StatefulWidget {
  const posititonedcontainer({super.key});

  @override
  State<posititonedcontainer> createState() => _posititonedcontainerState();
}

class _posititonedcontainerState extends State<posititonedcontainer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Merged Containers',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Merged Containers'),
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 300,
            color: Colors.blue,
            child: Stack(
              children: [
                Positioned(
                  top: 50,
                  left: 50,
                  width: 100,
                  height: 100,
                  child: Container(
                    color: Colors.red,
                    child: Text('Container 1'),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  right: 50,
                  width: 100,
                  height: 100,
                  child: Container(
                    color: Colors.green,
                    child: Text('Container 2'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}