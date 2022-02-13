import 'package:equatable/equatable.dart';
import '/core/core.dart';
import '/screens/login/domain/repository/login_repository.dart';

class LoginEmail implements UseCase<Future, LoginParams> {
  final LoginRepository repository;

  LoginEmail(this.repository);

  @override
  Future<String?> call(LoginParams params) async {
    return await repository.loginEmail(
      params.email.trim(),
      params.password.trim(),
    );
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
