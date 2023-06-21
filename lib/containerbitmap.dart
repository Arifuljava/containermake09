


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class containerbitmap extends StatefulWidget {
  const containerbitmap({super.key});

  @override
  State<containerbitmap> createState() => _containerbitmapState();
}

class _containerbitmapState extends State<containerbitmap> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Container to Bitmap'),
        ),
        body: Center(
          child: ContainerToBitmap(),
        ),
      ),
    );
  }
}

class ContainerToBitmap extends StatefulWidget {
  @override
  _ContainerToBitmapState createState() => _ContainerToBitmapState();
}

class _ContainerToBitmapState extends State<ContainerToBitmap> {
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Container(
        width: 200,
        height: 200,
        color: Colors.blue,
        child: Center(
          child: Text(
            'Hello, World!',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Future<Uint8List?> captureContainer() async {
    try {
      Uint8List? imageBytes = await screenshotController.capture();
      return imageBytes;
    } catch (e) {
      print(e);
      return null;
    }
  }

  void convertContainerToBitmap() async {
    Uint8List? bitmap = await captureContainer();
    // Use the bitmap as desired, e.g., display or save it.
    // In this example, we print the byte length of the bitmap.
    print('Bitmap byte length: ${bitmap?.lengthInBytes}');
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      convertContainerToBitmap();
    });
  }
}
