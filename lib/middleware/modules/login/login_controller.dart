import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_testing/middleware/custom_full_dialog.dart';
import 'package:getx_testing/middleware/modules/home/home_controller.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../routes/app_routes.dart';
import '../splash/splash_controller.dart';

class MiddlewareLoginController extends GetxController{
  MiddlewareSplashController splashController=Get.find<MiddlewareSplashController>();

  Future login()async{
    CustomFullDialog.showDialogg();
    GoogleSignInAccount ? googleSignInAccount=await splashController.googleSignIn.signIn();
    if (googleSignInAccount==null) {
      CustomFullDialog.cancelDialogg();
    } else {
      GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount.authentication;
      final OAuthCredential credential=GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken
      );
      await splashController.auth.signInWithCredential(credential);
      CustomFullDialog.cancelDialogg();
      
    }
  }
  

  // final GetStorage _storage=GetStorage();
  // void login()async{
  //   await _storage.write('id', 1);
  //   await _storage.write('name', 'Kaung Kaung');
  //   Get.offAllNamed(Routes.home);
  // }
}