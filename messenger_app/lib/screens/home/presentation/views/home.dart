import 'package:flutter/material.dart';
import 'package:messenger_app/core/core.dart';
import 'package:messenger_app/injector.dart';
import '../blocs/cubit/home_cubit.dart';
import 'home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => sl.get<HomeCubit>(),
      child: BlocBuilder<HomeCubit, HomeState>(
        bloc: sl.get<HomeCubit>(),
        builder: (context, state) {
          return Background(
            child: const HomeView(),
            image: state.user!.photo != null
                ? Image.network(state.user!.photo!)
                : const Icon(Icons.person),
            text: state.user!.name ?? state.error.toString(),
          );
        },
      ),
    );
  }
}
