import 'package:get/get.dart';
import 'package:getx_testing/middleware/modules/splash/splash_controller.dart';

class MiddlewareSplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MiddlewareSplashController>(() => MiddlewareSplashController());
  }

}