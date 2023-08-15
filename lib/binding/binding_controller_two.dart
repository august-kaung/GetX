import 'package:get/get.dart';
class BindingControllerTwo extends GetxController{
  var count=0.obs;
  void decrement(){
    count--;
  }
}