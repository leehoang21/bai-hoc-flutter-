import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Container(
          constraints: const BoxConstraints(
            minHeight: 100,
            minWidth: 100,
          ),
          child: SizedBox.fromSize(
            //size: const Size(200, 200),
            child: Container(
              width: 300,
              height: 300,
              color: Colors.amber,
              child: const Text(
                'a',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
