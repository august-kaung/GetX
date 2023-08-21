import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/google_sign_in/google_provider.dart';
import 'package:getx_testing/google_sign_in/sign_up_screen.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const GoogleMyApp());
}
class GoogleMyApp extends StatelessWidget {
  const GoogleMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider<GoogleProvider>(
      create: (context)=>GoogleProvider(),
      child:const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GoogleSignUpScreen(),
      ),
    );
  }
}

