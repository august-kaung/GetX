import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/qr_scanner/qr_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrHome extends StatelessWidget {
  QrHome({super.key});

  QrController qrController = Get.put(QrController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner Testing'),
      ),
      body: Column(
        children: [
          Obx(() => QrImageView(
                data: qrController.qr.value,
                size: 300,
              )),
          TextField(
            controller: qrController.controller,
            onChanged: (data) => qrController.qr.value = data,
          ),
          ElevatedButton(onPressed: (){
            qrController.scan();
          }, child: const Text('Scan QR Code'))
        ],
      ),
    );
  }
}
