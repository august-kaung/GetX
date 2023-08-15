import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/reactive_statemanagement/my_controller.dart';
import 'package:getx_testing/reactive_statemanagement/student_class.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var getController=Get.put(MyController());
  //final studentObj=Student(name: 'kaunghtet',age: 24).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Main Screen'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              IconButton(onPressed: (){
                getController.increment();
              }, icon:const Icon(Icons.plus_one)),
              GetBuilder<MyController>(
                  id: 'one',
                  builder: (controller){return
                    Text(controller.count.toString());
                  },
              ),
              Spacer(),
              GetBuilder<MyController>(
                id: 'two',
                builder: (controller){return
                  Text(controller.count.toString());
                },
              ),
              //Text(getController.count.toString()),
              IconButton(onPressed: (){
                getController.decrement();
              }, icon:const Icon(Icons.exposure_minus_1)),
            ],
          ),
          Obx(() => Text(getController.studentObj.value.name)),
          ElevatedButton(onPressed: (){
            getController.changeUpperCase();
            // studentObj.update(
            //     (studentObj)=>studentObj!.name=studentObj.name.toString().toUpperCase()
            // );
          }, child:const Text('Update to upper'))
        ],
      ),
    );
  }
}
