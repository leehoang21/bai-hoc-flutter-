import 'package:flutter/material.dart';
import 'package:stream/teststream.dart';

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
      appBar: AppBar(
        title: StreamBuilder<int>(
          stream: TestStream().counterStream,
          builder: (context, snapshot) {
            return Text(
                snapshot.hasData ? (snapshot.data! + 10).toString() : 'haha');
          },
        ),
      ),
      body: StreamBuilder(
        stream: TestStream().counterStream,
        builder: (context, snapshot) {
          return Text(snapshot.hasData ? snapshot.data.toString() : 'null');
        },
      ),
    );
  }
}
