import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_testing/workers/worker_controller.dart';

class WorkerScreen extends StatelessWidget {
   WorkerScreen({super.key});
final workerController=Get.put(WorkerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workers'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            workerController.increment();
          }, child:const Icon(Icons.add)),
          TextField(
            onChanged: (val){
            workerController.increment();
            },
          )
        ],
      ),
    );
  }
}
