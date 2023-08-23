import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multiselect/multiselect.dart';

import 'multi_select_controller.dart';

void main() {
  runApp(const MultiSelectMyApp());
}

class MultiSelectMyApp extends StatelessWidget {
  const MultiSelectMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiSelectScreen(),
    );
  }
}

//Default Display Results with chips
class MultiSelectScreen extends StatelessWidget {
  MultiSelectScreen({super.key});

  final MultiselectController controller = Get.put(MultiselectController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validation'),
      ),
      body: Column(
        children: [
          MultiSelectDialogField(
            listType: MultiSelectListType.LIST,
            chipDisplay: MultiSelectChipDisplay.none(),
            items: controller.fruitList
                .map((e) => MultiSelectItem(e, '$e Fruit'))
                .toList(),
            onConfirm: (data) {
              controller.selectedList = data;
              controller.selectedValue.value = '';
              for (var element in controller.selectedList) {
                controller.selectedValue.value =
                    '${controller.selectedValue.value} , $element';
              }
            },
          ),
          Obx(() => Text(controller.selectedValue.value.toString())),
          ElevatedButton(
              onPressed: () {
                controller.showMulti();
              },
              child: const Text('Show Dialog')),
          DropDownMultiSelect(
              whenEmpty: 'Please Your Favorite State Management',
              options: controller.fruitList,
              selectedValues: controller.selectedList,
              onChanged: (val) {
                controller.selectedList = val;
                controller.selectedValue.value = '';
                for (var ele in controller.selectedList) {
                  controller.selectedValue.value =
                      '${controller.selectedValue.value} $ele';
                }
              }),
          Obx(() => Text(controller.selectedValue.value))
        ],
      ),
    );
  }
}
