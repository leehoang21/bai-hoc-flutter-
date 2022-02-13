import 'package:firebase_auth/firebase_auth.dart' as _firebaseauth;
import '../model/user_model.dart';
import '../../core/failure/login_failure.dart';
import '../datasource/login_local_data_source.dart';
import '../datasource/login_remote_datasource.dart';
import '../../domain/repository/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  LoginRemoteDatasource remoteDatasource;
  LoginLocalDataSource localDataSource;
  LoginRepositoryImpl({
    required this.remoteDatasource,
    required this.localDataSource,
  });

  @override
  Future<String?> loginEmail(String email, String password) async {
    return _login('email', email, password);
  }

  @override
  Future<String?> loginFace() async {
    return _login('face');
  }

  @override
  Future<String?> loginGoogle() async {
    return _login('google');
  }

  Future<String?> _login(String type, [String? email, String? password]) async {
    UserModel? _login;
    try {
      if (type == 'email') {
        _login = await remoteDatasource.logInWithEmailAndPassword(
          email: email!,
          password: password!,
        );
      } else if (type == 'face') {
        _login = await remoteDatasource.loginWithFacebook();
      } else {
        _login = await remoteDatasource.loginWithGoogle();
      }
      localDataSource.cacheUser(_login);
      return null;
    } on _firebaseauth.FirebaseAuthException catch (e) {
      return LogInFailure().error(e.code);
    } catch (_) {
      return 'An unknown error';
    }
  }
}
