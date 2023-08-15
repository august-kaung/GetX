import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_testing/binding/binding_controller_one.dart';
import 'package:getx_testing/binding/binding_home_screen.dart';

class BindingScreen extends StatelessWidget {
  const BindingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Binding Screen'),
      ),
      body: Column(
        children: [
          GetBuilder<BindingControllerOne>(
              builder: (controller){
               return Text(controller.count.toString());
              }),

          ElevatedButton(onPressed: (){
            Get.find<BindingControllerOne>().increment();
          },child:const Text('plus one')),
          ElevatedButton(onPressed: (){
            Get.to(const BindingHomeScreen());
    }, child:const Text('GO to binding home screen'))
        ],
      ),
    );
  }
}
