import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_app/config/configs.dart';
import '../blocs/login_cubit/login_cubit.dart';
import '../widgets/forgot_password.dart';
import '../widgets/login_filed.dart';
import '../widgets/login_with.dart';
import '../widgets/push_signup.dart';
import '/core/widget/widget.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 60.h,
        ),
        Text(context.watch<LoginCubit>().state.errorMessage ?? ''),
        LoginField(
          emailController: _emailController,
          passController: _passController,
        ),
        const ForgotPassword(),
        SizedBox(
          height: 30.h,
        ),
        context.read<LoginCubit>().state is LoginLoading
            ? const CircularProgressIndicator()
            : const Text(''),
        RoundedButton(
          text: "Đăng nhập",
          press: (context) {
            context
                .read<LoginCubit>()
                .onLoginWithEmailAndPasswordPressed(
                  _emailController.text,
                  _passController.text,
                )
                .then(
                  (value) => context.read<LoginCubit>().state is LoginSuccess
                      ? Navigator.pushNamed(context, Routes.home)
                      : null,
                );
          },
        ),
        SizedBox(
          height: 10.h,
        ),
        const PushSignup(),
        const LoginWith(),
      ],
    );
    ;
  }
}
