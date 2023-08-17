import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'draggable_controller.dart';

void main() {
  runApp(const DraggableScrollableMyApp());
}

class DraggableScrollableMyApp extends StatelessWidget {
  const DraggableScrollableMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: DraggableScreen(),
    );
  }
}

class DraggableScreen extends StatelessWidget {
  DraggableScreen({super.key});

  final DraggableController controller = Get.put(DraggableController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draggable Screen'),
      ),
      body: Stack(
        children: [
          Container(
            width: context.width,
            height: context.height,
            color: Colors.black,
            child: const Text('THIS IS DRAGGABLE TESTING',style: TextStyle(color: Colors.white),),
          ),
          DraggableScrollableSheet(
            builder: (context, ScrollController scrollController) {
              return Container(
                margin:const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.all(20),
                color: Colors.white,
                child: ListView.builder(
                    controller: scrollController,
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return Obx(() => ListTile(
                            leading: CircleAvatar(
                              child: Text(index.toString()),
                            ),
                            title: Text('This is title $index'),
                            selectedColor: controller.selected[index]
                                ? Colors.green
                                : null,
                            selectedTileColor: controller.selected[index]
                                ? Colors.blue
                                : null,
                            selected: controller.selected[index],
                            onTap: () => controller.selected[index] =
                                !controller.selected[index],
                          ));
                    }),
              );
            },
            minChildSize: 0.15,
            maxChildSize: 0.9,
            initialChildSize: 0.3,
          )
        ],
      ),
    );
  }
}
