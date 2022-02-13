part of 'obscure_text_cubit.dart';

abstract class ObscureTextState {
  final bool obscureText;
  final bool obscureText2;

  ObscureTextState(this.obscureText, this.obscureText2);
}

class IsObscureText extends ObscureTextState {
  IsObscureText(bool obscureText, bool obscureText2)
      : super(obscureText, obscureText2);
}
