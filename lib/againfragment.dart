


import 'package:flutter/material.dart';

class againfragment extends StatefulWidget {
  const againfragment({super.key});

  @override
  State<againfragment> createState() => _againfragmentState();
}

class _againfragmentState extends State<againfragment> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Sheet Dialog',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showContainer = false;

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    showContainer = true;
                  });
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.icecream
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Sheet Dialog'),
      ),
      body: Stack(
        children: [
          // Existing content of the screen
          Center(
            child: ElevatedButton(
              onPressed: () {
                _showBottomSheet(context);
              },
              child: Text('Show Bottom Sheet'),
            ),
          ),
          // Container to overlay on top
          if (showContainer)
            Container(
              height: 250,
              width: 250,
              color: Colors.black54,
              child: Center(
                child: TextField(
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: "Enter  name",
                   hintText: "Enter your name"

                 ),
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}