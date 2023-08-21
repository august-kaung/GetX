import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_testing/middleware/modules/login/login_controller.dart';


class MiddlewareLoginPage extends StatelessWidget {
  const MiddlewareLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //Get.find<MiddlewareLoginController>().login();
        },
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Get.find<MiddlewareLoginController>().login();
          },
          child:const Text('Login With Google')),
      ),
    );
  }
}
