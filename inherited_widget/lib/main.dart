import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // trong constructor của MyHomePage truyền thêm param myChild
      home: MyHomePage(myChild: MyCenterWidget()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.myChild})
      : super(key: key); // thêm dòng này

  final Widget myChild; // thêm dòng này

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    print('1. hàm build được gọi do hàm setState được gọi');
    return Scaffold(
      body: MyInheritedWidget(
        myData: counter,
        child: widget
            .myChild, // sửa lại dòng code này, sử dụng `widget.child` thay vì tạo mới `MyCenterWidget()`
        // `widget` chính reference của MyHomePage widget ấy.
        // vì vậy widget.myChild tương đương với subtree của MyHomePage, chính là từ MyCenterWidget đến hết cây
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          incrementCounter();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> incrementCounter() async {
    setState(() {
      counter++;
    });
    await File('D:\\counter.txt').writeAsString(('$counter'));
  }
}

class MyCenterWidget extends StatelessWidget {
  const MyCenterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('2. log build MyCenterWidget');
    return const Center(
      child: MyText(),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = MyInheritedWidget.of(context)!.myData;
    print('3. log build MyText với counter = $counter');
    return Text('Tui là widget Text. Data của tui hiện tại là: $counter');
  }
}

class MyInheritedWidget extends InheritedWidget {
  const MyInheritedWidget(
      {Key? key, required Widget child, required this.myData})
      : super(key: key, child: child);

  final int myData;

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return myData !=
        oldWidget
            .myData; // nếu data thay đổi thì return true để rebuild các widget con phụ thuộc
  }

  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }
}
