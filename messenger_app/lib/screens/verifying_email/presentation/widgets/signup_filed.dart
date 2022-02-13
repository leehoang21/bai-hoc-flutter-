import 'package:flutter/material.dart';

class SignUpField extends StatelessWidget {
  const SignUpField({
    Key? key,
    required this.emailController,
    required this.passController,
    required this.passConfirmController,
    required this.nameController,
  }) : super(key: key);
  final TextEditingController emailController;
  final TextEditingController passController;
  final TextEditingController passConfirmController;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // RoundedInputField(
          //   userController: nameController,
          //   hintText: "Tên hiển thị",
          // ),
          // RoundedInputField(
          //   userController: emailController,
          //   hintText: "Email",
          //   errorText: context.watch<SignupBloc>().state.errorEmail,
          // ),
          // RoundedPasswordField(
          //   onPressed: (context) {
          //     context.read<ObscureTextCubit>().onObscureText();
          //   },
          //   obscureText: context.watch<ObscureTextCubit>().state.obscureText,
          //   passController: passController,
          //   errorText: context.watch<SignupBloc>().state.errorPass,
          //   hintText: 'Mật Khẩu',
          // ),
          // RoundedPasswordField(
          //   onPressed: (context) {
          //     context.read<ObscureTextCubit>().onObscureText2();
          //   },
          //   obscureText: context.watch<ObscureTextCubit>().state.obscureText2,
          //   passController: passConfirmController,
          //   errorText: context.watch<SignupBloc>().state.errorConfirmPass,
          //   hintText: 'Xác nhận mật Khẩu',
          // ),
        ],
      ),
    );
  }
}
