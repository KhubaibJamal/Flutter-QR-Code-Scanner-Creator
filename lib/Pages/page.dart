import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class PageR extends StatefulWidget {
  const PageR({Key? key}) : super(key: key);

  @override
  State<PageR> createState() => _PageRState();
}

class _PageRState extends State<PageR> {
  Barcode? barcode;
  QRViewController? controller;

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((barcode) {
      setState(() {
        this.barcode = barcode;
      });
    });
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else {
      // this is for IOS
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          barcode != null ? 'Result:${barcode!.code}' : 'Scan a code',
        ),
      ),
    );
  }
}
