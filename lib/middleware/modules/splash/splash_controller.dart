import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../routes/app_routes.dart';

class MiddlewareSplashController extends GetxController {
  late GoogleSignIn googleSignIn;
  var isSignIn=false.obs;
  FirebaseAuth auth=FirebaseAuth.instance;

  @override
  void onReady()async{
    googleSignIn=await GoogleSignIn();
    ever(isSignIn, handler);
    isSignIn.value=auth.currentUser!=null;
    await auth.authStateChanges().listen((event) {
      isSignIn.value= event!=null;
    });
    super.onReady();
  }
  handler(isLoggedIn)async{
    if (isLoggedIn) {
     await Get.offAllNamed(Routes.home,arguments: auth.currentUser);
    } else {
     await Get.offAllNamed(Routes.login);
    }
  }
  // GetStorage getStorage = GetStorage();
  // var imageString = 'assets/d.jpg';
  // @override
  // void onReady() {
  //   super.onReady();
  //   if (getStorage.read('name') == null) {
  //     Future.delayed(
  //       const Duration(seconds: 5),
  //       () => Get.offAllNamed(Routes.login),
  //     );
  //   } else {
  //     Future.delayed(
  //       const Duration(seconds: 5),
  //       () => Get.offAllNamed(Routes.home),
  //     );
  //   }
  // }
}
