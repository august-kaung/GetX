import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PasswordMeterController extends GetxController{
  var password=''.obs;
  var displayText='Enter a password'.obs;
  var passwordStrength=0.0.obs;
  RegExp numberExp=RegExp(r".*[0-9].*");
  RegExp letterExp=RegExp(r".*[A-Za-z].*");

  void checkPasswordStrength(String val){
    password.value=val.trim();
    if(password.value.isEmpty){
      passwordStrength.value=0;
      displayText.value='Please Enter Password!';
    }
    else if(password.value.length<6){
      passwordStrength.value=0.25;
      displayText.value='Short';
    }
    else if(password.value.length<8){
      passwordStrength.value=0.5;
      displayText.value='Strong';
    }else{
      if(!numberExp.hasMatch(password.value) || !letterExp.hasMatch(password.value)){
        passwordStrength.value=0.75;
        displayText.value='Little Strong';
      }else{
        passwordStrength.value=1;
        displayText.value='Strongest';
      }
    }
  }
}