import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../domain/usecase/signup_with_email_and_password.dart';
import '../../../../../../core/error/error_input_data.dart';
part 'signup_state.dart';

class SignUpCubit extends Cubit<SignupState> {
  SignUpWithEmailAndPassword signUpWithEmailAndPassword;
  SignUpCubit(this.signUpWithEmailAndPassword) : super(SignUpInit());

  Future<void> signUp(
      String email, String pass, String displayName, String confirmPass) async {
    emit(
      SignUpLoading(
          errorConfirmPass: ErrorInputData().errorInputPass(confirmPass),
          errorPass: ErrorInputData().errorInputPass(pass),
          errorEmail: ErrorInputData().errorInputEmail(email)),
    );

    final _noError = state.errorEmail == null &&
        state.errorConfirmPass == state.errorPass &&
        state.errorPass == null &&
        state.errorConfirmPass == null &&
        displayName.isNotEmpty;

    if (state.errorConfirmPass != state.errorPass) {
      emit(
        const SignUpFailied(
            errorMessage: 'mật khẩu và mật khẩu xác nhận không trùng nhau'),
      );
    }
    if (_noError) {
      final _error = await signUpWithEmailAndPassword(SignUpParams(
        displayName: displayName,
        email: email,
        password: pass,
      ));
      if (_error == null) {
        emit(SignUpSuccess());
      } else {
        emit(SignUpFailied(errorMessage: _error));
      }
    }
  }
}
