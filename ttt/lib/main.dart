import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttt/ff.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      bloc: CounterBloc(),
      builder: (context, state) {
        return Scaffold(
          body: ElevatedButton(
              onPressed: () {
                context.read<CounterBloc>().add(IncrementEvent());
                print(context.read<CounterBloc>().state is IncrementState);
              },
              child:
                  Text(context.watch<CounterBloc>().state.counter.toString())),
        );
      },
    );
  }
}
