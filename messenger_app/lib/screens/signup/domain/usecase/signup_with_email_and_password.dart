import 'package:equatable/equatable.dart';
import 'package:messenger_app/core/core.dart';
import 'package:messenger_app/screens/signup/domain/reponsitories/signup_repositories.dart';

class SignUpWithEmailAndPassword implements UseCase<Future, SignUpParams> {
  SignUpRepositories repositories;
  SignUpWithEmailAndPassword(this.repositories);

  @override
  Future<String?> call(SignUpParams signUpParams) async {
    return await repositories.signUpWithEmailAndPassword(
      signUpParams.email.trim(),
      signUpParams.password.trim(),
      signUpParams.displayName,
    );
  }
}

class SignUpParams extends Equatable {
  final String displayName;
  final String email;
  final String password;

  const SignUpParams({
    required this.displayName,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [displayName, email, password];
}
