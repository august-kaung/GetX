import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/elegant_button/elegant_controller.dart';
import 'package:numberpicker/numberpicker.dart';

void main() {
  runApp(const PackagesMyApp());
}

class PackagesMyApp extends StatelessWidget {
  const PackagesMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: NumberPickerScreen(),
    );
  }
}

class NumberPickerScreen extends StatelessWidget {
  NumberPickerScreen({super.key});

  final PackageController controller = Get.put(PackageController());

  @override
  Widget build(BuildContext context) {
    bool test=MediaQuery.of(context).viewInsets.bottom!=0;
    print(test);
    return Scaffold(
      floatingActionButton: Visibility(
        visible: !test,
        child: FloatingActionButton(
          onPressed: () {
            Get.snackbar('Info', '${controller.currentValue.value}');
          },
        ),
      ),
      appBar: AppBar(
        title: const Text('Number Picker Screen'),
      ),
      body: Center(
        child: Obx(
          () => Column(
            children: [
              NumberPicker(
                axis: Axis.horizontal,
                value: controller.currentValue.value,
                onChanged: (value) {
                  controller.currentValue.value = value;
                },
                maxValue: 20,
                minValue: 0,
                step: 1,

                selectedTextStyle:
                    const TextStyle(color: Colors.red, fontSize: 30),
              ),
              TextField()
            ],
          ),
        ),
      ),
    );
  }
}

/////////////////////////FAILED//////////////////////////////
// class ElegantScreen extends StatelessWidget {
//   ElegantScreen({super.key});
//
//   final ElegantController controller = Get.put(ElegantController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Elegant Screen'),
//       ),
//       body: Center(
//         child: ElegantNumberButton(
//           color: Colors.cyan,
//
//           initialValue: controller.initialNumber.value,
//           minValue: 0,
//           maxValue: 10,
//           onChanged: (value) {
//             controller.initialNumber.value = value;
//           },
//           decimalPlaces: 2,
//           step: 0.5,
//         ),
//       ),
//     );
//   }
// }
