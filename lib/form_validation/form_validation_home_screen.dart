import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/form_validation/form_validation_controller.dart';

void main(){
  runApp(const FormValidationMyApp());
}
class FormValidationMyApp extends StatelessWidget {
  const FormValidationMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FormValidationHomeScreen(),
    );
  }
}
class FormValidationHomeScreen extends StatelessWidget {
   FormValidationHomeScreen({super.key});
  final FormValidationController controller=Get.put(FormValidationController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text('Form Validation'),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: controller.key,
        child: Column(
          children: [
            TextFormField(
              controller: controller.emailController,
              validator: (text){
                return controller.emailValidator(text!);

              },
              onSaved: (value){
                controller.email=value!;
              },
            ),
            TextFormField(
              controller: controller.passwordController,
              validator: (text){
                return controller.passwordValidator(text!);
              },
              onSaved: (value){
                controller.password=value!;
              },
            ),
            ElevatedButton(onPressed: (){
              controller.validateForm();
              controller.emailController.clear();
              controller.passwordController.clear();
              debugPrint('${controller.email} and ${controller.password}');
            }, child:const Text('Submit'))
          ],
        ),
      ),
    );
  }
}
