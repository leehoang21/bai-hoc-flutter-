import '/core/core.dart';
import '/screens/login/domain/repository/login_repository.dart';

class LoginGoogle implements UseCase<Future, NoParams> {
  final LoginRepository repository;

  LoginGoogle(this.repository);

  @override
  Future<String?> call(NoParams params) async {
    return await repository.loginGoogle();
  }
}
