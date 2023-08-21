import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class QrController extends GetxController{
  TextEditingController controller =TextEditingController();

  var qr=''.obs;
  var scannedQRCode='';

  Future<void>scan()async{
    scannedQRCode=await FlutterBarcodeScanner.scanBarcode(
        '#FF5733', 'Cancel', true, ScanMode.QR);
    Get.snackbar('Result', scannedQRCode,snackPosition: SnackPosition.TOP);
  }
}