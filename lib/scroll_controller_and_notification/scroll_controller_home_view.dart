import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_testing/scroll_controller_and_notification/scroll_controller_controller.dart';

class ScrollControllerHomeView extends StatelessWidget {
    ScrollControllerHomeView({super.key});

  final MyScrollControllerController _controller=Get.put(MyScrollControllerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scroll Controller And Notification'),
        actions: [
          IconButton(
              onPressed: () {
                _controller.scrollUp();
              },
              icon: const Icon(Icons.arrow_drop_up)),
          IconButton(
              onPressed: () {
                _controller.scrollDown();
              },
              icon: const Icon(Icons.arrow_drop_down_outlined)),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.green,
            child: Obx(() => Text(_controller.scrollPositionText.value,style:const TextStyle(
              color: Colors.red
            ),)),
          ),
          Container(
            color: Colors.yellow,
            child:  Obx(() => Text(_controller.scrollNotificationText.value)),
          ),
          Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (notification){
                  if(notification is ScrollStartNotification){
                     _controller.started();
                  }
                  else if(notification is ScrollUpdateNotification){
                    _controller.updated();
                  }
                  else if(notification is ScrollEndNotification){
                    _controller.ended();
                  }
                  return true;
                },
                child: ListView.builder(
                    controller: _controller.scrollController,
                    itemCount: 50,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('LIST TILE $index'),
                      );
                    }),
              ))
        ],
      ),
    );
  }
}
