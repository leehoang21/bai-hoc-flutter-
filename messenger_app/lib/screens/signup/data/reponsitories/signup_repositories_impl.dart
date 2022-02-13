import 'package:firebase_auth/firebase_auth.dart';
import '../../core/failure/signup_failure.dart';
import '../datasources/signup_remote_data_source.dart';
import '../../domain/reponsitories/signup_repositories.dart';

class SignUpRepositoriesImpl extends SignUpRepositories {
  SignUpRemoteDataSource remoteDataSource;
  SignUpRepositoriesImpl({required this.remoteDataSource});
  @override
  Future<String?> signUpWithEmailAndPassword(
      String email, String password, String displayName) async {
    try {
      await remoteDataSource.signUpWithEmailAndPassword(
        email: email,
        password: password,
        displayName: displayName,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return SignUpFailure.failure(e.code);
    } catch (_) {
      return 'An unknown error';
    }
  }
}
