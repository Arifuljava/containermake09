


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(imagegetter());
}

class imagegetter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Crop Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _pickAndCropImage() async {
    final PermissionStatus permissionStatus = await Permission.photos.request();

    if (permissionStatus.isGranted) {
      final picker = ImagePicker();
      final pickedImage = await picker.getImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        final File pickedFile = File(pickedImage.path);
        final croppedImageFile = await _cropImage(pickedFile);

        // Use the cropped image as required
        print('Cropped Image Path: ${croppedImageFile.path}');
      }
    } else {
      // Handle permission denied
      if (permissionStatus.isDenied) {
        // Display an error message or request permission again
      }
    }
  }

  Future<File> _cropImage(File imageFile) async {
    final tempDir = await getTemporaryDirectory();
    final targetPath = tempDir.path + '/cropped_image.jpg';

    await FlutterImageCompress.compressAndGetFile(
      imageFile.path,
      targetPath,
      quality: 100,
      minWidth: 500,
      minHeight: 500,
    );

    return File(targetPath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Crop Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _pickAndCropImage,
              child: Text('Pick and Crop Image'),
            ),
          ],
        ),
      ),
    );
  }
}
