import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FormValidationController extends GetxController{

  final GlobalKey<FormState>key=GlobalKey<FormState>();
  late TextEditingController emailController,passwordController;

  var email='';
  var password='';

  String ? emailValidator(String value){
    if(!GetUtils.isEmail(value)){
      return 'Incorrect Email';
    }
    return null;
  }
  String ? passwordValidator(String value){
    if(value.length<6){
      return 'Incorrect Password';
    }
    return null;
  }
  void validateForm(){
    final isValid=key.currentState!.validate();
    if(!isValid){
      return;
    }else{
      key.currentState!.save();
    }

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailController=TextEditingController();
    passwordController=TextEditingController();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }


}