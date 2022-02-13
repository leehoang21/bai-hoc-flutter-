import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../model/user_model.dart';

class LoginRemoteDatasource {
  final FirebaseAuth firebaseAuth;
  final FacebookAuth facebookAuth;
  final GoogleSignIn googleSignIn;

  LoginRemoteDatasource({
    required this.googleSignIn,
    required this.facebookAuth,
    required this.firebaseAuth,
  });

  Future<UserModel?> logInWithEmailAndPassword(
      {required String email, required String password}) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    return UserModel.toUser(firebaseAuth.currentUser);
  }

  Future<UserModel?> loginWithFacebook() async {
    final loginResult = await facebookAuth.login();
    final facebookCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    await firebaseAuth.signInWithCredential(facebookCredential);

    return UserModel.toUser(firebaseAuth.currentUser);
  }

  Future<UserModel?> loginWithGoogle() async {
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth?.idToken,
      accessToken: googleAuth?.accessToken,
    );
    await firebaseAuth.signInWithCredential(credential);

    return UserModel.toUser(firebaseAuth.currentUser);
  }
}
