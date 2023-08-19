import 'package:get/get.dart';
import 'package:getx_testing/middleware/modules/login/login_controller.dart';

class MiddlewareLoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MiddlewareLoginController>(() => MiddlewareLoginController());
  }}