part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  final String? errorMessage;
  final String? errorEmail;
  final String? errorPass;

  const LoginState({
    this.errorEmail,
    this.errorPass,
    this.errorMessage,
  });
  @override
  List<Object?> get props => [errorMessage, errorEmail, errorPass];
}

class LoginInit extends LoginState {}

class LoginLoading extends LoginState {
  const LoginLoading({String? errorEmail, String? errorPass})
      : super(errorEmail: errorEmail, errorPass: errorPass);
}

class LoginFailure extends LoginState {
  const LoginFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}

class LoginSuccess extends LoginState {}
