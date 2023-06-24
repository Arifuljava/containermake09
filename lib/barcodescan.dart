




import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class barcodescan extends StatefulWidget {
  const barcodescan({super.key});

  @override
  State<barcodescan> createState() => _barcodescanState();
}

class _barcodescanState extends State<barcodescan> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barcode Scanner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BarcodeScannerPage(),
    );
  }
}

class BarcodeScannerPage extends StatelessWidget {
  Future<void> scanBarcode(BuildContext context) async {
    try {
      var result = await BarcodeScanner.scan();
      print("Result : "+result.rawContent); // Handle the scanned barcode here
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        print('Camera permission denied');
      } else {
        print('Error: $e');
      }
    } on FormatException {
      print('User canceled the scan');
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode Scanner'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => scanBarcode(context),
          child: Text('Scan Barcode'),
        ),
      ),
    );
  }
}