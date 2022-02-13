import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/login_cubit/login_cubit.dart';
import '../blocs/obscuretext_cutbit/obscure_text_cubit.dart';
import '/core/widget/widget.dart';

class LoginField extends StatelessWidget {
  const LoginField(
      {Key? key, required this.emailController, required this.passController})
      : super(key: key);
  final TextEditingController emailController;
  final TextEditingController passController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoundedInputField(
          userController: emailController,
          hintText: "Email",
          errorText: context.watch<LoginCubit>().state.errorEmail,
        ),
        RoundedPasswordField(
          onPressed: (context) {
            context.read<ObscureTextCubit>().onObscureText();
          },
          obscureText: context.watch<ObscureTextCubit>().state.obscureText,
          passController: passController,
          errorText: context.watch<LoginCubit>().state.errorPass,
          hintText: 'Mật Khẩu',
        ),
      ],
    );
  }
}
