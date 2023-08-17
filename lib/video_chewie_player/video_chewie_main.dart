import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_testing/video_chewie_player/video_chewie_home_view.dart';

void main(){
  runApp(const ChewieApp());
}
class ChewieApp extends StatelessWidget {
  const ChewieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: VideoChewieHomeView(),
    );
  }
}
