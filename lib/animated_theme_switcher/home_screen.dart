import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'animated_theme_controller.dart';
import 'constant/app_color.dart';

class AnimatedThemeSwitcherHomeScreen extends StatelessWidget {
  AnimatedThemeSwitcherHomeScreen({super.key});

  final AnimatedThemeController controller = Get.put(AnimatedThemeController());

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Animated Theme Switcher'),
          actions: [
            ThemeSwitcher(
                builder: (context) => Obx(() => IconButton(
                  onPressed: () {
                    controller.changeTheme(context);
                  },
                  icon: controller.isDarkMode.value?const Icon(CupertinoIcons.moon_stars):const Icon(Icons.brightness_high_sharp),
                )))
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                'THIS IS PRIMARY TEXT',
                style: TextStyle(color: AppColors().kPrimaryTextColor),
              ),
              Text(
                'this is Secondary text',
                style: TextStyle(color: AppColors().kSecondaryTextColor),
              ),
              Container(
                  width: 200, height: 200, color: AppColors().containerColor),
            ],
          ),
        ),
      ),
    );
  }
}