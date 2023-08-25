import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'multi_list_view_controller.dart';

void main(){
  runApp(const MultiListApp());
}
class MultiListApp extends StatelessWidget {
  const MultiListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiListScreen(),
    );
  }
}
class MultiListScreen extends StatelessWidget {
   MultiListScreen({super.key});
final MultiListController controller=Get.put(MultiListController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text('Multi ListView Selected'),
      ),
      body: ListView.builder(
          itemCount: controller.personList.length,
          itemBuilder: (context,index){
            return Obx(() => InkWell(
              onTap: (){
                controller.personList[index].isSelected.value=!controller.personList[index].isSelected.value;
              },
              child: ListTile(
                //selectedColor:controller.personList[index].isSelected.value ? Colors.red : null ,
                tileColor: controller.personList[index].isSelected.value ? Colors.red : null,
                //selectedTileColor: controller.personList[index].isSelected.value ? Colors.red : null,
                title: Text(controller.personList[index].name??''),
                subtitle: Text(controller.personList[index].isSelected.toString()??''),

              ),
            ));
          }
      ),
    );
  }
}
