

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:image_editor/image_editor.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';


import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';


class imageeditorget extends StatefulWidget {
  const imageeditorget({super.key});

  @override
  State<imageeditorget> createState() => _imageeditorgetState();
}

class _imageeditorgetState extends State<imageeditorget> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
    title: 'Container Screenshot',
    theme: ThemeData(
    primarySwatch: Colors.blue,
    ),
    home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  GlobalKey _containerKey = GlobalKey();

  Future<void> captureScreenshot() async {
    RenderRepaintBoundary boundary =
    _containerKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/screenshot.png');
    await file.writeAsBytes(pngBytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container Screenshot'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RepaintBoundary(
              key: _containerKey,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Container',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                captureScreenshot();
              },
              child: Text('Capture Screenshot'),
            ),
          ],
        ),
      ),
    );
  }
}