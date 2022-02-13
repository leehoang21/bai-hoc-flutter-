import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/config/configs.dart';
import '../../../../injector.dart';
import '../blocs/login_cubit/login_cubit.dart';
import 'login_view.dart';
import '../blocs/obscuretext_cutbit/obscure_text_cubit.dart';
import '/core/widget/back_ground.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl.get<LoginCubit>(),
        ),
        BlocProvider(
          create: (_) => ObscureTextCubit(),
        ),
      ],
      child: Background(
        image: Image.asset(IconsPath.login),
        text: 'Login',
        child: LoginView(),
      ),
    );
  }
}
