import 'package:get/get.dart';
import 'package:getx_testing/middleware/modules/login/login_controller.dart';

class MiddlewareLoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<MiddlewareLoginController>( MiddlewareLoginController());
  }}