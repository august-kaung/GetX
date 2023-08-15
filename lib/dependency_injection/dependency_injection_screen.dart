import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_testing/dependency_injection/dependency_injection_controller.dart';

class DependencyInjectionScreen extends StatelessWidget {
   DependencyInjectionScreen({super.key});
   //final controller=Get.put(()=>DependencyInjectionController());
   //final controller=Get.lazyPut(()=>DependencyInjectionController());
   final controller=Get.putAsync<DependencyInjectionController>(()async=>await DependencyInjectionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Dependency Injection '),
      ),
      body: Column(
        children: [
          //Text(controller.count.toString()),
          ElevatedButton(
            onPressed: (){
              //Get.find<DependencyInjectionController>().increment();
              Get.find<DependencyInjectionController>().increment();
            },
            child:const Text('Click Me!'),
          ),
        ],
      ),
    );
  }
}
