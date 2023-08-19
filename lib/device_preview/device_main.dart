import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/device_preview/device_home.dart';
import 'package:path/path.dart';

void main(){
  runApp(
    DevicePreview(builder: (context)=>const DeviceMyApp())
  );
}
class DeviceMyApp extends StatelessWidget {
  const DeviceMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: DeviceHomeView(),
    );
  }
}

