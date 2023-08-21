import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_testing/middleware/modules/splash/splash_view.dart';
import 'package:getx_testing/middleware/routes/app_pages.dart';

import 'modules/splash/splash_binding.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  MiddlewareSplashBinding().dependencies();
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
