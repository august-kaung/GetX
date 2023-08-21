import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/stepper/stepper_controller.dart';

void main() {
  runApp(const StepperMyApp());
}

class StepperMyApp extends StatelessWidget {
  const StepperMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: StepperHomeScreen(),
    );
  }
}

class StepperHomeScreen extends StatelessWidget {
  StepperHomeScreen({super.key});

  final StepperController controller = Get.put(StepperController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Form Validation'),
        ),
        body: Obx(
          () => Stepper(
            type: StepperType.horizontal,
            currentStep: controller.currentStep.value,
            steps: buildStep(),
            onStepContinue: () {
              if (controller.currentStep.value == buildStep().length - 1) {
                Get.snackbar('title', 'last');
              } else {
                controller.currentStep.value++;
              }
            },
            onStepCancel: () {
              if (controller.currentStep.value == 0) {
                Get.snackbar('title', 'no more');
              } else {
                controller.currentStep.value--;
              }
            },
            onStepTapped: (index) {
              controller.currentStep.value = index;
            },
            controlsBuilder: (context, details) {
              return Row(
                children: [
                  ElevatedButton(
                      onPressed: details.onStepContinue,
                      child: Text((controller.currentStep.value ==
                              buildStep().length - 1)
                          ? 'Submit'
                          : 'Forward')),
                  const SizedBox(
                    width: 50,
                  ),
                  if (controller.currentStep.value != 0)
                    ElevatedButton(
                        onPressed: details.onStepCancel,
                        child: const Text('Backward')),
                ],
              );
            },
          ),
        ));
  }

  List<Step> buildStep() {
    return [
      Step(
          state: controller.currentStep.value > 0
              ? StepState.complete
              : StepState.indexed,
          isActive: controller.currentStep.value >= 0,
          title: const Text('First Step'),
          content: Container(
            width: double.infinity,
            height: 200,
            color: Colors.red,
          )),
      Step(
          state: controller.currentStep.value > 1
              ? StepState.complete
              : StepState.indexed,
          isActive: controller.currentStep.value >= 1,
          title: const Text('Second Step'),
          content: Container(
            width: double.infinity,
            height: 200,
            color: Colors.green,
          )),
      Step(
          state: controller.currentStep.value > 2
              ? StepState.complete
              : StepState.indexed,
          isActive: controller.currentStep.value >= 2,
          title: const Text('Third Step'),
          content: Container(
            width: double.infinity,
            height: 200,
            color: Colors.blue,
          )),
    ];
  }
}
