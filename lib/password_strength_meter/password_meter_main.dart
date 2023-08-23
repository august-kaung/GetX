import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/password_strength_meter/password_meter_controller.dart';

void main(){
  runApp(const MeterMyApp());
}
class MeterMyApp extends StatelessWidget {
  const MeterMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MeterHomeScreen(),
    );
  }
}
class MeterHomeScreen extends StatelessWidget {
   MeterHomeScreen({super.key});
  final PasswordMeterController controller=Get.put(PasswordMeterController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text('Meter Indicator'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            TextField(
              onChanged: (val){
                controller.checkPasswordStrength(val);
              },
            ),
            const SizedBox(height: 20,),
            Obx(() => LinearProgressIndicator(
                value: controller.passwordStrength.value,
                color: (controller.passwordStrength.value<=0.25)?Colors.redAccent:
                (controller.passwordStrength.value<=0.5)?Colors.orangeAccent:
                (controller.passwordStrength.value<=0.75)?Colors.greenAccent:
                Colors.amberAccent
            )),
            const SizedBox(height: 20,),
            Obx(() => Text(
              controller.displayText.value
            ))
          ],
        ),
      ),
    );
  }
}
