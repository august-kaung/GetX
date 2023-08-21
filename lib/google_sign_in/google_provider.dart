import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleProvider extends ChangeNotifier{
  final googleSignIn=GoogleSignIn();
  GoogleSignInAccount ? user;
  //GoogleSignInAccount ? get user=>_user;

  Future logIn()async{
    try{
      final _googleUser=await googleSignIn.signIn();
      if(_googleUser==null){
        return;
      }
      user=_googleUser;

      final _auth=await _googleUser.authentication;
      final credential=GoogleAuthProvider.credential(
          accessToken: _auth.accessToken,
          idToken: _auth.idToken
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      notifyListeners();
    }catch (e){
      print('@@@@@@@@@@@@@@@@@${e.toString()}');
    }
  }
}