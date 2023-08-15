import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main()async{
  await GetStorage.init();
  runApp(const GetStorageApp());
}

class GetStorageApp extends StatelessWidget {
  const GetStorageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetStorageScreen(),
    );
  }
}
class GetStorageScreen extends StatelessWidget {
   GetStorageScreen({super.key});
   final storage=GetStorage();
final TextEditingController emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text('Get Storage and Email validator'),
      ),
      body: Column(
        children: [
          TextField(
            controller: emailController,
          ),
          ElevatedButton(onPressed: (){
            if(GetUtils.isEmail(emailController.text)){
              storage.write('emailData', emailController.text);
              emailController.clear();
            }else{
              Get.snackbar('Something went wrong', 'Please dont forget @ character!');
            }
          }, child:const Text('Confirm')),
          ElevatedButton(onPressed: (){
            print(storage.read('emailData'));
          }, child:const Text('Show Saved Data')),
        ],
      ),
    );
  }
}

