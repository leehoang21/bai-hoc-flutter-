part of 'signup_cubit.dart';

abstract class SignupState extends Equatable {
  final String? errorMessage;
  final String? errorEmail;
  final String? errorPass;
  final String? errorConfirmPass;

  const SignupState({
    this.errorMessage,
    this.errorEmail,
    this.errorPass,
    this.errorConfirmPass,
  });

  @override
  List<Object?> get props =>
      [errorConfirmPass, errorEmail, errorMessage, errorPass];
}

class SignUpInit extends SignupState {}

class SignUpLoading extends SignupState {
  const SignUpLoading({
    required String? errorConfirmPass,
    required String? errorPass,
    required String? errorEmail,
  }) : super(
          errorConfirmPass: errorConfirmPass,
          errorEmail: errorEmail,
          errorPass: errorPass,
        );
}

class SignUpFailied extends SignupState {
  const SignUpFailied({String? errorMessage})
      : super(errorMessage: errorMessage);
}

class SignUpSuccess extends SignupState {}
