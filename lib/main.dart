import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/binding/all_controllers_binding.dart';
import 'package:getx_testing/binding/binding_home_screen.dart';
import 'package:getx_testing/dependency_injection/dependency_injection_controller.dart';
import 'package:getx_testing/dependency_injection/dependency_injection_screen.dart';
import 'package:getx_testing/reactive_statemanagement/main_screen.dart';
import 'package:getx_testing/screen/first_screen.dart';
import 'package:getx_testing/screen/home_screen.dart';
import 'package:getx_testing/screen/second_screen.dart';
import 'package:getx_testing/screen/unknown_route.dart';
import 'package:getx_testing/workers/worker_screen.dart';

import 'binding/binding_screen.dart';
void main()async{
  //await initializeService();
runApp(const MyApp());
}
// Future<void>initializeService()async{
//   await Get.putAsync(()async => DependencyInjectionController());
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      //initialBinding: AllControllersBinding(),
      //initialRoute: '/',
      // getPages: [
      //   GetPage(name: '/', page: ()=>FirstScreen()),
      //   GetPage(name: '/second', page: ()=>SecondScreen()),
      //   GetPage(name: '/home/:someValue', page: ()=>HomeScreen()),
      // ],
      //unknownRoute: GetPage(name: '/notfound', page: ()=>UnknownScreen()),
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home:  BindingScreen(),
    );
  }
}
