part of 'obscure_text_cubit.dart';

abstract class ObscureTextState {
  final bool obscureText;

  ObscureTextState(this.obscureText);
}

class IsObscureText extends ObscureTextState {
  IsObscureText(bool obscureText) : super(obscureText);
}
