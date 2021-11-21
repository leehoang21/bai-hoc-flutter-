import 'package:flutter/material.dart';
import 'package:multi_provider/dem.dart';
import 'package:multi_provider/setting.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => Dem(),
    ),
    ChangeNotifierProvider(
      create: (_) => ChuDe(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<Dem, ChuDe>(
      builder: (context, value, value2, child) => MaterialApp(
        theme: context.watch<ChuDe>().theme(),
        home: Scaffold(
          appBar: AppBar(
            leading: ElevatedButton(
              onPressed: () {
                context.read<Dem>().add();
              },
              child: const Icon(
                Icons.add,
              ),
            ),
            title: Text(value.dem.toString()),
            actions: [
              Switch(
                value: value2.getThemelaToi,
                onChanged: (value) => context.read<ChuDe>().thayDoiTheme(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
