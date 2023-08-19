import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_testing/middleware/modules/splash/splash_view.dart';
import 'package:getx_testing/middleware/routes/app_pages.dart';

void main()async{
  await GetStorage.init();
  runApp(const MiddlewareMyApp());
}
class MiddlewareMyApp extends StatelessWidget {
  const MiddlewareMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      home: MiddlewareSplashPage(),
    );
  }
}
