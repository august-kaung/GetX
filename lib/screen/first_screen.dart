import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/screen/home_screen.dart';
import 'package:getx_testing/screen/second_screen.dart';
class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String str='ok br';
    return Scaffold(
      appBar: AppBar(title:const Text('FirstScreen'),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: ()async{
                //Get.to(const SecondScreen(),arguments: 'This is Data from First Screen');
                //var data=await Get.to(()=>SecondScreen());
                //print(data);
                Get.toNamed('/second?firstData=Hello&secondData=World');
              },
              child:const Text('Go to Second Screen'),
            ),
            ElevatedButton(
              onPressed: (){
                Get.toNamed('/home/$str');
              },
              child:const Text('Go to Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
