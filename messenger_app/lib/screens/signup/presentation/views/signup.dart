import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/config/configs.dart';
import 'package:messenger_app/injector.dart';
import '../blocs/cutbits/obscure/obscure_text_cubit.dart';
import 'signup_view.dart';
import 'package:messenger_app/screens/signup/signup.dart';
import '/core/widget/back_ground.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => sl.get<SignUpCubit>(),
          ),
          BlocProvider(
            create: (context) => ObscureTextCubit(),
          )
        ],
        child: Background(
          image: Image.asset(IconsPath.signUp),
          text: 'Sign Up',
          child: SignUpView(),
        ));
  }
}
