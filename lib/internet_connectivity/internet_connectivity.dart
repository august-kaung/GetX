import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_testing/internet_connectivity/network_binding.dart';

import 'home_view.dart';

void main()async{
  runApp(const InternetConnectivityApp());
}

class InternetConnectivityApp extends StatelessWidget {
  const InternetConnectivityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      initialBinding: NetworkBinding(),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
