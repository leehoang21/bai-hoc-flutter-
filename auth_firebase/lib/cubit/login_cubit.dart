import 'package:auth_firebase/authentication_service/authentication_service.dart';
import 'package:auth_firebase/authentication_service/src/failure/failure.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthenticationSerivce _authenticationSerivce;
  LoginCubit(this._authenticationSerivce) : super(const LoginState());

  void onPasswordChanged(String password) {
    emit(state.copyWith(password: password));
  }

  void onEmailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  void onLoginWithEmailAndPasswordPressed() async {
    if (state.status == LoginStatus.failure) {
      return;
    }
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      await _authenticationSerivce.logInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(state.copyWith(
        status: LoginStatus.failure,
        errorMessage: e.message,
      ));
    }
  }

  void onLoginWithGooglePressed() async {
    try {
      await _authenticationSerivce.logInWithGoogle();
    } on LogInWithGoogleFailure catch (e) {
      emit(state.copyWith(
        status: LoginStatus.failure,
        errorMessage: e.message,
      ));
    }
  }

  void onLoginWithFacebookPressed() async {
    try {
      await _authenticationSerivce.logInWithFacebook();
    } on LogInWithGoogleFailure catch (e) {
      emit(state.copyWith(
        status: LoginStatus.failure,
        errorMessage: e.message,
      ));
    }
  }
}
