import 'package:firebase_auth/firebase_auth.dart';

class SignUpRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  SignUpRemoteDataSource({required this.firebaseAuth});

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String displayName,
  }) async {
    var credential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await credential.user!.updateDisplayName(displayName);
  }
}
