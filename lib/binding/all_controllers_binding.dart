import 'package:get/get.dart';
import 'package:getx_testing/binding/binding_controller_one.dart';
import 'package:getx_testing/binding/binding_controller_two.dart';

class AllControllersBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BindingControllerOne());
    Get.lazyPut(() => BindingControllerTwo());
  }

}