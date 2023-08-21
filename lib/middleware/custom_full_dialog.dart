import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomFullDialog{
  static void showDialogg(){
    Get.dialog(
      Center(child: const CircularProgressIndicator())
    );
  }
  static void cancelDialogg(){
    Get.back();
  }
}