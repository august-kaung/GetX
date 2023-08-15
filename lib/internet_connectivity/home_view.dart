import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/internet_connectivity/network_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home View'),
      ),
      body: Center(
        child: Obx(
            ()=>Text(
               (Get.find<NetworkController>().networkStatus==1)?'Wifi Connection':
               (Get.find<NetworkController>().networkStatus==2)?'Mobile Data Connection':
               'No Internet Connection'
            )
        ),
      ),
    );
  }
}
