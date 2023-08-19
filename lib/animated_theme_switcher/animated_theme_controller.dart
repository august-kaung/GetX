import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_testing/animated_theme_switcher/constant/app_themes.dart';
import 'package:getx_testing/animated_theme_switcher/constant/get_storage_key.dart';

class AnimatedThemeController extends GetxController{
  late GetStorage getStorage;
  var isDarkMode=false.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getStorage=GetStorage();
    isDarkMode.value=getStorage.read(GetStorageKey.IS_DARK_MODE)??false;
  }
  void changeTheme(BuildContext context){
    var theme=Get.isDarkMode?AppThemes.lightThemeData:AppThemes.darkThemeData;
    ThemeSwitcher.of(context).changeTheme(theme: theme);
    if(getStorage.read(GetStorageKey.IS_DARK_MODE)){
      getStorage.write(GetStorageKey.IS_DARK_MODE, false);
    }else{
      getStorage.write(GetStorageKey.IS_DARK_MODE, true);
    }
  }
}