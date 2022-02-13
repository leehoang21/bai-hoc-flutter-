import 'package:firebase_auth/firebase_auth.dart';

class VerifyRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  VerifyRemoteDataSource({required this.firebaseAuth});

  Future<void> sendEmailVerification() async {
    final user = firebaseAuth.currentUser;
    if (!(user!.emailVerified)) {
      await user.sendEmailVerification();
    }
  }

  Future<bool> isEmailVerified() async {
    await firebaseAuth.currentUser!.reload();
    return firebaseAuth.currentUser!.emailVerified;
  }

  Future deleteUser() async {
    return await firebaseAuth.currentUser!.delete();
  }
}
