

import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print((Get.parameters['someValue']));
    return Scaffold(
      appBar: AppBar(title:const Text('HOME SCREEN'),),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.snackbar('Hello GetX', 'This is snackbar');
        },
        child:const Icon(Icons.shower_sharp),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Get.defaultDialog(title: 'Hello',content:const Text('This is dialog '));
            }, child:const Text('Dialog')),
            ElevatedButton(onPressed: (){
              Get.bottomSheet(
                SizedBox(
                 child: Wrap(
                  children: [
                    ListTile(title:const Text('Light Theme'),onTap: ()=>{
                      Get.changeTheme(ThemeData.light())
                    },),
                    ListTile(title:const Text('Dark Theme'),onTap: ()=>{
                      Get.changeTheme(ThemeData.dark())
                    },)
                  ],
                 ),
               )
              );
            }, child:const Text('Bottom Sheet'))
          ],
        ),
      ),
    );
  }
}
