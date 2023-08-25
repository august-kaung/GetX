import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/elegant_button/elegant_controller.dart';
import 'package:getx_testing/packages/package_controller.dart';

void main() {
  runApp(const MyPackageApp());
}

class MyPackageApp extends StatelessWidget {
  const MyPackageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: PackagePage(),
    );
  }
}

class PackagePage extends StatelessWidget {
  PackagePage({super.key});

  final MyPackageController controller=Get.put(MyPackageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validation'),
      ),
      floatingActionButton: Builder(
        builder: (context) {
          return FabCircularMenuPlus(
              key: controller.key,
              children: [
            RawMaterialButton(
              key: key,
              onPressed: () {
                print('Clicked Home');
                controller.key.currentState!.close();
              },
              child: const Icon(Icons.home),
            ),
            RawMaterialButton(
              key: key,
              onPressed: () {
                print('Clicked Email');
                controller.key.currentState!.close();
              },
              child: const Icon(Icons.add_reaction_sharp),
            ),
            RawMaterialButton(
              key: key,
              onPressed: () {
                print('Clicked Phone');
                controller.key.currentState!.close();
              },
              child: const Icon(Icons.email),
            ),
            RawMaterialButton(
              key: key,
              onPressed: () {
                print('Clicked Data');
                controller.key.currentState!.close();
              },
              child: const Icon(Icons.phone),
            ),
          ]);
        },
      ),
    );
  }
}
