import 'package:flutter/material.dart';
import 'package:messenger_app/config/configs.dart';
import 'package:messenger_app/core/core.dart';
import 'package:messenger_app/screens/signup/presentation/widgets/push_login.dart';
import '../widgets/rules.dart';
import '../widgets/signup_filed.dart';
import 'package:messenger_app/screens/signup/signup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  SignUpView({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _passConfirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Text(
            context.watch<SignUpCubit>().state.errorMessage ?? '',
          ),
        ),
        SignUpField(
          nameController: _nameController,
          emailController: _emailController,
          passController: _passController,
          passConfirmController: _passConfirmController,
        ),
        const Rules(),
        context.watch<SignUpCubit>().state is SignUpLoading
            ? const CircularProgressIndicator()
            : const Text(''),
        RoundedButton(
          text: 'Signup',
          press: (context) {
            context
                .read<SignUpCubit>()
                .signUp(_emailController.text, _passController.text,
                    _nameController.text, _passConfirmController.text)
                .then((value) {
              if (context.read<SignUpCubit>().state is SignUpSuccess) {
                Navigator.pushNamed(context, Routes.verify);
              }
            });
          },
        ),
        const PushLogin(),
      ],
    );
  }
}
