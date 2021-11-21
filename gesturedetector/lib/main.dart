import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragStart: (details) {
          setState(() {
            _color = Colors.green;
          });
        },
        onHorizontalDragEnd: (details) {
          setState(() {
            _color = Colors.grey;
          });
        },
        onTap: () {
          setState(() {
            _color = Colors.amber;
          });
        },
        onDoubleTap: () {
          setState(() {
            _color = Colors.red;
          });
        },
        onLongPress: () {
          setState(() {
            _color = Colors.white;
          });
        },
        child: Container(
          color: _color,
        ),
      ),
    );
  }
}
