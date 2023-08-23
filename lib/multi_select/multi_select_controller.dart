import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class MultiselectController extends GetxController {
  List<String> fruitList = [
    'apple',
    'orange',
    'pineapple',
    'mango steen',
    'water melon',
    'basil',
    'avocado',
    'lily'
  ];
  List<dynamic> selectedList = [];
  var selectedValue = ''.obs;

  void showMulti() async{
    await showDialog(context: Get.context!,builder: (ct){
      return MultiSelectDialog(
        initialValue: selectedList,
        listType: MultiSelectListType.LIST,
        items: fruitList.map((e) => MultiSelectItem(e, '$e Fruit')).toList(),
        onConfirm: (data) {
          selectedList = data;
          selectedValue.value = '';
          for (var element in selectedList) {
            selectedValue.value = '${selectedValue.value} , $element';
          }
        },
      );
    });
  }
}
