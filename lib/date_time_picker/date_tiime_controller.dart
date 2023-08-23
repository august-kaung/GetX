import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DateTimeController extends GetxController{
  var selectedDate=DateTime.now().obs;
  var selectedTime=TimeOfDay.now().obs;
  var selectedDateRange=DateTimeRange(start: DateTime.now(), end: DateTime(
    DateTime.now().year,DateTime.now().month  ,DateTime.now().day+4
  )).obs;

  void pickedRange()async{
    DateTimeRange ? range=await showDateRangePicker(
        context: Get.context!,
        firstDate: DateTime(2020),
        lastDate: DateTime(2024));
    if(range!=null && range!=selectedDateRange.value){
      selectedDateRange.value=range;
    }
  }

  void pickedTime()async{
    TimeOfDay ? time=await showTimePicker(context: Get.context!, initialTime: selectedTime.value);
    if(time!=null && time!=selectedTime.value){
      selectedTime.value=time;
    }
  }

  void pickedDate()async{
    DateTime ? date=await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2020),
        lastDate: DateTime(2024));
    if(date!=null && date!=selectedDate.value){
      selectedDate.value=date;
    }
  }

}