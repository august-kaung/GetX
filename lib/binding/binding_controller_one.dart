import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get.dart';
class BindingControllerOne extends GetxController{
  var count=0;
  void increment(){
    count++;
    update();
  }
}