import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FilterController extends GetxController {
  var isLoading=false.obs;
  List<String> sourceFruitList = [
    'apple',
    'orange',
    'pineapple',
    'mango steen',
    'water melon',
    'basil',
    'avocado',
    'lily'
  ];
  var foundFruitList = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    foundFruitList.value = sourceFruitList;
  }
  void load()async{
    isLoading.value=true;
    await Future.delayed(Duration(seconds: 4));
    isLoading.value=false;
  }
  void filterFruit(String name) {
    List<String> results = [];
    if (name.isEmpty) {
      results = sourceFruitList;
    } else {
      results = sourceFruitList
          .where(
              (element) => element.toLowerCase().contains(name.toLowerCase()))
          .toList();
    }
    foundFruitList.value=results;
  }
}
