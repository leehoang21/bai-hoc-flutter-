import 'package:consumer_provider1/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Dem(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    ),
  );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Dem>(
      builder: (context, value, child) {
        return Scaffold(
          body: Column(
            children: [
              Center(
                child: Text(
                  value.dem.toString(),
                  style: const TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => value.demCong1(),
                child: const Icon(Icons.add),
              ),
              ElevatedButton(
                  onPressed: () => value.demTru1(),
                  child: const Text(
                    '-',
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }
}
