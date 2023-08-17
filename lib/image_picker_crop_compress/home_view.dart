import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/image_picker_crop_compress/home_controller.dart';
import 'package:getx_testing/internet_connectivity/home_view.dart';
import 'package:image_picker/image_picker.dart';

class ImageHomeView extends StatelessWidget {
   ImageHomeView({super.key});
final HomeController controller=HomeController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Obx(() => controller.imageSelectedPath.value==''?
              const Text('Please Select Image'):
                Image.network((controller.imageSelectedPath.value=='')?'assets/d.jpg':controller.imageSelectedPath.value)),
              //Image.file(File(controller.imageSelectedPath.value))),
            Obx(() => controller.imageSelectedSize.value==''?
            const Text(''):
            Text(controller.imageSelectedSize.value)),
            ElevatedButton(onPressed: (){
              controller.getImage(ImageSource.camera);
            }, child:const Text('Choose From Camera')),
            ElevatedButton(onPressed: (){
              controller.getImage(ImageSource.gallery);
            }, child:const Text('Choose From Gallery')),
          ],
        ),
      ),
    );
  }
}
