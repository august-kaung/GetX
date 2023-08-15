import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('${Get.parameters['firstData']},${Get.parameters['secondData']}');
    //print(Get.arguments);
    return Scaffold(
      appBar: AppBar(title:const Text('SecondScreen'),),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
          //Get.back();
            Get.back(result: 'This is data return from second screen');
          },
          child:const Text('Go to First Screen'),
        ),
      ),
    );
  }
}
