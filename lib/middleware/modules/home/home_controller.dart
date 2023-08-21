import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_testing/middleware/modules/splash/splash_controller.dart';

import '../../routes/app_routes.dart';

class MiddlewareHomeController extends GetxController {
MiddlewareSplashController splashController=Get.find<MiddlewareSplashController>();
late User  user;
@override
  void onInit() {
   
    super.onInit();
    user=Get.arguments;
  }
  logout()async{
    await splashController.auth.signOut();
    await splashController.googleSignIn.disconnect();
  }

  // final GetStorage _storage = GetStorage();
  // var name = '';
  // void logout() {
  //   _storage.erase();
  //   Get.offAllNamed(Routes.splash);
  // }
  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   name = _storage.read('name');
  // }
}
