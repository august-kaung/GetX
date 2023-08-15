import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WorkerController extends GetxController{
  var count=0.obs;

  void increment(){
    count++;
  }

  @override
  void onInit() {
    //ever(count, (callback) => debugPrint('value is changed'));
    debounce(count, (callback) => debugPrint('changed'),time: Duration(seconds: 2));
   // interval(count, (callback) => debugPrint('changedddddd'),time: Duration(seconds: 3));
    super.onInit();
  }
}