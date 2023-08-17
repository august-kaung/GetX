import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyScrollControllerController extends GetxController{
  var scrollPositionText=''.obs;
  var scrollNotificationText=''.obs;
  ScrollController ? scrollController;

  void started(){
    scrollNotificationText.value='STARTED';
  }
  void updated(){
    scrollNotificationText.value='UPDATED';
  }
  void ended(){
    scrollNotificationText.value='ENDED';
  }


  @override
  void onInit() {
    super.onInit();
    scrollController=ScrollController();
    scrollController!.addListener(() {
      if(scrollController!.offset>=scrollController!.position.maxScrollExtent){
        scrollPositionText.value='At The Bottom';
      }
      if(scrollController!.offset<=scrollController!.position.minScrollExtent){
        scrollPositionText.value='At The Top';
      }
    });

  }
  void scrollUp(){
    scrollController!.animateTo(scrollController!.offset-50, duration:const Duration(seconds: 1), curve: Curves.bounceIn);
  }
  void scrollDown(){
    scrollController!.animateTo(scrollController!.offset+50, duration:const Duration(seconds: 1), curve: Curves.bounceIn);
  }
}