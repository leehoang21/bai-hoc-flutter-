import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          const Positioned(
            left: 0,
            top: 0,
            child: SizedBox(
              width: 100,
              height: 100,
            ),
          ),
          AnimatedPositioned(
            left: 0,
            top: 300,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.amber,
            ),
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }
}
