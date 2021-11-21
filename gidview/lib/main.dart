import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Column(
          children: [
            
            GridView.custom(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,),
              childrenDelegate: SliverChildListDelegate(children))
            // GridView.count(
            //   //shrinkWrap: true,
            //   crossAxisCount: 3,
            //   padding: EdgeInsets.all(16),
            //   crossAxisSpacing: 16,
            //   mainAxisSpacing: 16,
            //   physics: const NeverScrollableScrollPhysics(),
            //   children: [
            //     for (var i = 0; i < 30; i++) Text('$i'),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
