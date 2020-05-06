import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Provider.dart';

class Auth {

  Auth._insternal();

  static Auth get instance => Auth._insternal();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<FirebaseUser> get user async {
    return (await _firebaseAuth.currentUser());
  }

  Future<FirebaseUser> facebook(BuildContext context) async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == 200) {
        /*   final userData = await FacebookAuth.instance.getUserData();
        print(userData);  SIN FIREBASE*/
        final AuthCredential credential = FacebookAuthProvider.getCredential(
            accessToken: result.accessToken.token);

        final AuthResult authResult = await _firebaseAuth.signInWithCredential(credential);
        final FirebaseUser user = authResult.user;
        /* Provider.userOf(context). */
        print("facebookuser name ${user.displayName}");
        return user;
      } else if (result.status == 403) {
        print("facebook login cancelled");
      } else {
        print("facebokk login fallo");
      }

      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<FirebaseUser> google() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication authentication =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: authentication.idToken,
          accessToken: authentication.accessToken);

      final AuthResult result =
          await _firebaseAuth.signInWithCredential(credential);

      final FirebaseUser user = result.user;

      print("user name ${user.displayName}");
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> logOut(BuildContext context) async {
    final String providerId = (await user).providerData[0].providerId;

    FirebaseUser userTest = await user;


    print("providerId: ${userTest.providerId}");

    switch (providerId) {
      case "facebook.com":
        await FacebookAuth.instance.logOut();
        break;
      case "google.com":
        await _googleSignIn.signOut();
        break;
      case "password":
        break;
      case "phone":
        break;
    }

    await _firebaseAuth.signOut();
    Navigator.pushNamedAndRemoveUntil(context, '/loginpage', (_) => false);
  }
}
