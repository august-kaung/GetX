import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoChewieController extends GetxController{
  late VideoPlayerController player;
  ChewieController ? chewieController;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initializedPlayer();
  }

  Future<void>initializedPlayer()async{
    player=VideoPlayerController.networkUrl(Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));
    await  Future.wait([player.initialize()]);
    chewieController=ChewieController(videoPlayerController: player);
    update();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    player.dispose();
    chewieController!.dispose();
  }
}