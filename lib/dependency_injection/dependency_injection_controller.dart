import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
//GetxController
class DependencyInjectionController extends GetxService{
  //var count=0.obs;
  void increment()async{
    // count++;
    // update();
    SharedPreferences prefs=await SharedPreferences.getInstance();
    int counter=(prefs.getInt('counter')??0 )+1;
    debugPrint(counter.toString());
    await prefs.setInt('counter', counter);

  }
}