import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_testing/middleware/modules/home/home_controller.dart';

class MiddlewareHomePage extends StatelessWidget {
  const MiddlewareHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //Get.find<MiddlewareHomeController>().logout();
        },
      ),
      // body: Center(
      //   child: Text(Get.find<MiddlewareHomeController>().name.toString()),
      // ),
    );
  }
}
