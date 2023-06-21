import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
class secondfragment extends StatefulWidget {
  const secondfragment({super.key});

  @override
  State<secondfragment> createState() => _againfragmentState();
}

class _againfragmentState extends State<secondfragment> {
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
          width: 250,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    showContainer = true;
                    showSecondTextField = true; // Show the second TextField
                  });
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.icecream,

                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  showContainer= false;
                },
                child: Text('Close'),
              ),
              ElevatedButton(onPressed: (){
                setState(() {
                  showContainer = true;
                  thirdcontainer = !thirdcontainer; // Toggle the second TextField
                });
                Navigator.pop(context);

              }, child: Text("Show Barcode")),
              ElevatedButton(onPressed: (){
                showContainer = true;
                showSecondTextField = !showSecondTextField;

              }, child: Text("Show Image"))

            ],
          ),
        );
      },
    );
  }
  bool showSecondTextField = false;
  bool thirdcontainer= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                  alignment: Alignment.center,
                  height: 250,
                  width: 250,
                  color: Colors.black54,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10,left: 20,right: 20),
                          child: Text(
                            "First",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        if (showSecondTextField) // Show the second TextField if enabled
                          Container(
                            margin: EdgeInsets.only(top: 10,left: 20,right: 20),
                            child: Icon(
                              Icons.icecream_sharp,
                              size: 60,
                            ),
                          ),
                        if(thirdcontainer)
                          Container(
                            margin: EdgeInsets.only(top: 10,left: 20,right: 20),
                            child: BarcodeWidget(
                              barcode: Barcode.code128(), // Specify the barcode type
                              data: '123456789', // Specify the data to encode
                              width: 200,
                              height: 100,
                              style: TextStyle(fontSize: 20),
                              ),


                          )
                      ],
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),

    );
  }
}