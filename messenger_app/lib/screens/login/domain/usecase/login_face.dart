import '/core/core.dart';
import '/screens/login/domain/repository/login_repository.dart';

class LoginFace implements UseCase<Future, NoParams> {
  final LoginRepository repository;

  LoginFace(this.repository);

  @override
  Future<String?> call(NoParams params) async {
    return await repository.loginFace();
  }
}
