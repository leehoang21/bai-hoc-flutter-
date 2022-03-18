import 'package:count_down_timer/blocs/bloc_animation_images/animation.dart';
import 'package:count_down_timer/blocs/bloc_time/time.dart';
import 'my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<TimeBloc>(
        create: (context) => TimeBloc(),
      ),
      BlocProvider<BlocAnimation>(
        create: (context) => BlocAnimation(),
      ),
    ],
    child: const MaterialApp(
      home: MyApp(),
    ),
  ));
}
