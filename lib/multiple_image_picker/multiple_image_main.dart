import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'multiple_image_home.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MultipleImageApp());
}
class MultipleImageApp extends StatelessWidget {
  const MultipleImageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultipleHomeScreen(),
    );
  }
}
class MultipleImageScreen extends StatelessWidget {
  const MultipleImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text('Form Validation'),
      ),
    );
  }
}
