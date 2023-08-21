import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'google_provider.dart';

class GoogleSignUpScreen extends StatelessWidget {
  const GoogleSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        var data=Provider.of<GoogleProvider>(context,listen: false).user;
        print(data.toString());
      }),
      appBar: AppBar(
        title:const Text('SIGIN UP SCREEN'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Provider.of<GoogleProvider>(context,listen: false).logIn();
          },
          child: const Text('Login in'),
        ),
      ),
    );
  }
}
