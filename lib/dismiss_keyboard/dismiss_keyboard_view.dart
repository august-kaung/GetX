import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(const DismissKeyboardMyApp());
}
class DismissKeyboardMyApp extends StatelessWidget {
  const DismissKeyboardMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: DismissKeyboardHomeScreen(),
    );
  }
}
class DismissKeyboardHomeScreen extends StatelessWidget {
  const DismissKeyboardHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title:const Text('Form Validation'),
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              TextField(
              ),
              Container(
                width: 300,
                height: 1600,
                color: Colors.green,
              )
            ],
          ),
        ),
      ),
    );
  }
}
