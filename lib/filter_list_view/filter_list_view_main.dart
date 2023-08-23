import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_testing/filter_list_view/filter_controller.dart';

void main(){
  runApp(const FilterMyApp());
}
class FilterMyApp extends StatelessWidget {
  const FilterMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FilterHome(),
    );
  }
}
class FilterHome extends StatelessWidget {
   FilterHome({super.key});
  final FilterController controller=Get.put(FilterController());
  final TextEditingController textEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text('Filter Text Field'),
      ),
      body: Column(
        children: [
          Obx(()=>
             ElevatedButton.icon(
              icon: controller.isLoading.value?Transform.scale(
                  scale: 0.5,
                  child: CircularProgressIndicator(color: Colors.white,)):Icon(Icons.abc),
                onPressed: (){
                controller.load();
                },
                label: Text(controller.isLoading.value?'Processing':'Upload'),),
          ),
          TextField(
            controller: textEditingController,
            onChanged: (text){
              controller.filterFruit(text);
            },
          ),
          Expanded(
              child: Obx(() => ListView.builder(
                  itemCount: controller.foundFruitList.length,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        textEditingController.text=controller.foundFruitList[index];
                      },
                      child: ListTile(
                        title: Text(controller.foundFruitList[index].toString()),
                      ),
                    );
                  }

              ),))
        ],
      ),
    );
  }
}
