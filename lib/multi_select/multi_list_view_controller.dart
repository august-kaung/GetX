import 'package:get/get.dart';

class MultiListController extends GetxController {
  List<Person> personList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    List.generate(
        20,
        (index) => personList
            .add(Person(name: 'Name : $index', isSelected: false.obs)));
  }
}

class Person {
  String name;
  var isSelected;

  Person({required this.name, required this.isSelected});
}
