import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_testing/binding/binding_controller_two.dart';

class BindingHomeScreen extends StatelessWidget {
  const BindingHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Bining Home Screen'),
      ),
      body: Column(
        children: [
          Obx(() => Text(Get.find<BindingControllerTwo>().count.toString())),
          ElevatedButton(onPressed: (){
            Get.find<BindingControllerTwo>().decrement();
          },child:const Text('minus one'))
        ],
      ),
    );
  }
}
