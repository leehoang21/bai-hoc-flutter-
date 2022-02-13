import 'package:flutter_bloc/flutter_bloc.dart';

part 'obscure_text_state.dart';

class ObscureTextCubit extends Cubit<ObscureTextState> {
  ObscureTextCubit() : super(IsObscureText(true, true));

  void onObscureText() {
    emit(IsObscureText(!state.obscureText, state.obscureText2));
  }

  void onObscureText2() {
    emit(IsObscureText(state.obscureText, !state.obscureText2));
  }
}
