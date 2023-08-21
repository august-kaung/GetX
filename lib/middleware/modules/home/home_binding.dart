import 'package:get/get.dart';

import 'package:getx_testing/middleware/modules/home/home_controller.dart';

class MiddlewareHomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<MiddlewareHomeController>( MiddlewareHomeController());
  }

}