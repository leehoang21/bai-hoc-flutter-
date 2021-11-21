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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestures Example'),
        centerTitle: true,
      ),
      body: Center(
          child: GestureDetector(
              onTap: () {
                print('Box Clicked');
              },
              child: Container(
                height: 60.0,
                width: 120.0,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Center(child: Text('Click Me')),
              ))),
    );
    // return Scaffold(
    //   body: Center(
    //     child: InkWell(
    //       splashColor: Colors.green,
    //       highlightColor: Colors.red,
    //       child: const Text(
    //         'hello',
    //         style: TextStyle(
    //           fontSize: 50,
    //         ),
    //       ),
    //       onTap: () {},
    //     ),
    //   ),
    //   // body: ElevatedButton(
    //   //   style: ElevatedButton.styleFrom(
    //   //     primary: Colors.amber,
    //   //     shape: CircleBorder(),
    //   //   ),
    //   //   onPressed: () {},
    //   //   child: const Icon(
    //   //     Icons.search,
    //   //   ),
    //   // ),
    // );
  }
}
