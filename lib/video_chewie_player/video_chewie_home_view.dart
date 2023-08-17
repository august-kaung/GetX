import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/video_chewie_player/video_chewie-controller.dart';

class VideoChewieHomeView extends StatelessWidget {
  const VideoChewieHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
      ),
      body: Column(
        children: [
          GetBuilder<VideoChewieController>(
              init: VideoChewieController(),
              builder: (controller) {
                return Expanded(
                    child: Center(
                        child: controller.chewieController != null &&
                            controller.chewieController!.videoPlayerController
                                .value.isInitialized
                            ? Chewie(controller: controller.chewieController!)
                            : const Text('Wrong Url')
                    ),);
              }),
        ]
      ),
    );
  }
}
