import 'package:auth_firebase/authentication_service/authentication_service.dart';
import 'package:auth_firebase/bloc/app_bloc.dart';
import 'package:auth_firebase/cubit/login_cubit.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/screen/screen.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.authenticationSerivce,
  }) : super(key: key);
  // Service truyền vào từ main
  final AuthenticationSerivce authenticationSerivce;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => authenticationSerivce,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AppBloc(
                  authenticationSerivce: authenticationSerivce,
                ),
              ),
              BlocProvider(
                create: (context) => LoginCubit(authenticationSerivce),
              ),
            ],
            child: const AppView(),
          )),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      bloc: AppBloc(authenticationSerivce: AuthenticationSerivce()),
      builder: (context, state) {
        return FlowBuilder<AppStatus>(
          state: state.status,
          onGeneratePages: _onGeneratePages,
        );
      },
    );
  }

  List<Page> _onGeneratePages(AppStatus state, List<Page> pages) {
    return [
      if (state == AppStatus.authenticated) Home.page(),
      if (state == AppStatus.unauthenticated) Login.page(),
    ];
  }
}
