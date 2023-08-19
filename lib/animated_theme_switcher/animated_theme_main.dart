import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_testing/animated_theme_switcher/animated_theme_controller.dart';
import 'package:getx_testing/animated_theme_switcher/constant/app_color.dart';
import 'package:getx_testing/animated_theme_switcher/constant/app_themes.dart';
import 'package:getx_testing/animated_theme_switcher/constant/get_storage_key.dart';

import 'home_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  GetStorage.init();
  final getStorage = GetStorage();
  await getStorage.write(GetStorageKey.IS_DARK_MODE, false);
   var  isDarkMode =  getStorage.read(GetStorageKey.IS_DARK_MODE);
  await getStorage.write(GetStorageKey.IS_DARK_MODE, isDarkMode);
  runApp(
    ThemeProvider(
      initTheme:
      //AppThemes.lightThemeData
      isDarkMode ? AppThemes.darkThemeData : AppThemes.lightThemeData,
      builder: (context, theme) => GetMaterialApp(
        theme: theme,
        darkTheme: AppThemes.darkThemeData,
        debugShowCheckedModeBanner: false,
        home: AnimatedThemeSwitcherHomeScreen(),
      ),

        ),
  );
}

// class AnimatedThemeSwitcherMyApp extends StatelessWidget {
//   const AnimatedThemeSwitcherMyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }


