import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/date_time_picker/date_tiime_controller.dart';
import 'package:intl/intl.dart';

void main(){
  runApp(const DateTimeMyApp());
}
class DateTimeMyApp extends StatelessWidget {
  const DateTimeMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: DateTimeScreen(),
    );
  }
}
class DateTimeScreen extends StatelessWidget {
  DateTimeScreen({super.key});
  final DateTimeController controller=Get.put(DateTimeController());
  final DateFormat format=DateFormat('dd-MM-yyyy');
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text('Date Time Screen'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Obx(() {
              return Text(
                format.format(controller.selectedDate.value).toString()
              );
            }),
            ElevatedButton(onPressed: (){
              controller.pickedDate();
            }, child: const Text('Choose Date')),
            Obx(() {
              return Text(
                  '${controller.selectedTime.value.hour} : ${controller.selectedTime.value.minute}'
              );
            }),
            ElevatedButton(onPressed: (){
              controller.pickedTime();
            }, child: const Text('Choose Time')),
            Obx(() {
              DateFormat df=DateFormat('dd / MM / yyyy');
              var startResult=df.format(controller.selectedDateRange.value.start);
              return Text(
                  'Start Date : $startResult'
              );
            }),
            Obx(() {
              DateFormat df=DateFormat('dd / MM / yyyy');
              var endResult=df.format(controller.selectedDateRange.value.end);
              return Text(
                  'Start Date : $endResult'
              );
            }),
            ElevatedButton(onPressed: (){
              controller.pickedRange();
            }, child: const Text('Choose Time'))
          ],
        ),
      ),
    );
  }
}
