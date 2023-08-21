import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/qr_scanner/qr_home.dart';

void main(){
  runApp(const QrScannerMyApp());
}
class QrScannerMyApp extends StatelessWidget {
  const QrScannerMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: QrHome(),
    );
  }
}
