import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/core.dart';
import '../../../domain/usecase/login_email.dart';
import '../../../domain/usecase/login_face.dart';
import '../../../domain/usecase/login_google.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginFace loginFace;
  final LoginGoogle loginGoogle;
  final LoginEmail loginEmail;

  LoginCubit({
    required this.loginEmail,
    required this.loginFace,
    required this.loginGoogle,
  }) : super(LoginInit());

  Future<void> onLoginWithEmailAndPasswordPressed(
      String email, String pass) async {
    emit(
      LoginLoading(
        errorEmail: ErrorInputData().errorInputEmail(email),
        errorPass: ErrorInputData().errorInputPass(pass),
      ),
    );

    final _noError = state.errorEmail == null && state.errorPass == null;

    if (_noError) {
      final _error = await loginEmail(LoginParams(
        email: email,
        password: pass,
      ));

      if (_error == null) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure(errorMessage: _error));
      }
    } else {
      emit(LoginInit());
    }
  }

  Future<void> onLoginWithGooglePressed() async {
    emit(const LoginLoading());

    final _error = await loginGoogle(NoParams());
    if (_error == null) {
      emit(LoginSuccess());
    } else {
      emit(LoginFailure(errorMessage: _error));
    }
  }

  Future<void> onLoginWithFacebookPressed() async {
    emit(const LoginLoading());
    final _error = await loginFace(NoParams());
    if (_error == null) {
      emit(LoginSuccess());
    } else {
      emit(LoginFailure(errorMessage: _error));
    }
  }
}
