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
      body: Column(children: [
        const SizedBox(height: 200,),
        Text(Get.find<MiddlewareHomeController>().user.displayName.toString()),
        Image.network(Get.find<MiddlewareHomeController>().user.photoURL.toString()),
        Text(Get.find<MiddlewareHomeController>().user.email.toString()),
        ElevatedButton(onPressed: (){
          Text(Get.find<MiddlewareHomeController>().logout());
        }, child:const Text('Log Out'))
      ]),
      // body: Center(
      //   child: Text(Get.find<MiddlewareHomeController>().name.toString()),
      // ),
    );
  }
}
