import 'package:auth_firebase/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  static MaterialPage page() {
    return const MaterialPage(
      child: Login(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (!(state.errorMessage == null)) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
        }
      },
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Firebase Login"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                const Text("Login", style: TextStyle(fontSize: 20)),
                const SizedBox(height: 20),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                  ),
                  onChanged: context.read<LoginCubit>().onEmailChanged,
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Pass",
                  ),
                  onChanged: context.read<LoginCubit>().onPasswordChanged,
                ),

                context.read<LoginCubit>().state.status == LoginStatus.loading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: context
                            .read<LoginCubit>()
                            .onLoginWithEmailAndPasswordPressed,
                        child: const Text("Login"),
                      ),
                const SizedBox(height: 40),
                const Text("Or sign in with"),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed:
                          context.read<LoginCubit>().onLoginWithGooglePressed,
                      child: const Text("Google"),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed:
                          context.read<LoginCubit>().onLoginWithFacebookPressed,
                      child: const Text("Facebook"),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SignUp();
                    }));
                  },
                  child: const Text("Sign Up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text('signup'),
    );
  }
}
