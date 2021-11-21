import 'package:flutter/material.dart';
import 'list_item.dart';

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
        body: ListView.separated(
            itemBuilder: (context, index) {
              return Center(
                child: Text(
                  '$index',
                  style: const TextStyle(fontSize: 20, color: Colors.amber),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Center(
                child: Text(
                  '$index',
                  style: const TextStyle(fontSize: 20, color: Colors.blue),
                ),
              );
            },
            itemCount: 20),
        // body: ListView.builder(
        //   //itemCount: 10,
        //   itemBuilder: (context, index) {
        //     return Text(
        //       '$index',
        //     );
        //   },
        // ),
        // body: ListView(
        //   //hoạt ảnh của động tác cuộn
        //   //ko cuộn : NeverScrollableScrollPhysics(),
        //   physics: const BouncingScrollPhysics(),
        //   //đảo ngược danh sách view
        //   //reverse: true,
        //   //chọn chiều cho danh sách view
        //   scrollDirection: Axis.vertical,
        //   children: [
        //     for (var i = 0; i < 10; i++) Text('$i'),
        //   ],
        // ),
      ),
    );
  }
}
// 