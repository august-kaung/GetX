import 'package:get/get.dart';
import 'package:getx_testing/image_picker_crop_compress/home_controller.dart';
import 'package:getx_testing/middleware/modules/home/home_controller.dart';

class MiddlewareHomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MiddlewareHomeController>(() => MiddlewareHomeController());
  }

}