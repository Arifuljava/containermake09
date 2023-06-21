



import 'package:flutter/material.dart';

class draganddropable extends StatefulWidget {
  const draganddropable({super.key});

  @override
  State<draganddropable> createState() => _draganddropableState();
}

class _draganddropableState extends State<draganddropable> {
  List<String> _items = ['Item 1', 'Item 2'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drag and Drop Containers',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Drag and Drop Containers'),
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 300,
            color: Colors.blue,
            child: Stack(
              children: [
                for (int i = 0; i < _items.length; i++)
                  Draggable<String>(
                    data: _items[i],
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                      child: Center(
                        child: Text(_items[i]),
                      ),
                    ),
                    feedback: Material(
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.red.withOpacity(0.5),
                        child: Center(
                          child: Text(_items[i]),
                        ),
                      ),
                    ),
                    childWhenDragging: Container(),
                  ),
                Positioned(
                  top: 150,
                  left: 150,
                  child: DragTarget<String>(
                    builder: (
                        BuildContext context,
                        List<dynamic> accepted,
                        List<dynamic> rejected,
                        ) {
                      return Container(
                        width: 100,
                        height: 100,
                        color: accepted.isEmpty ? Colors.grey : Colors.yellow,
                        child: Center(
                          child: Text('Drag Target'),
                        ),
                      );
                    },
                    onAccept: (String data) {
                      setState(() {
                        _items.remove(data);
                      });
                      print('Item accepted: $data');
                    },
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