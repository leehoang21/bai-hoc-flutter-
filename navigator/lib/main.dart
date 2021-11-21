import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Screen1(),
    onGenerateRoute: (RouteSettings settings) {
      switch (settings.name) {
        case '/':
          return MaterialPageRoute(builder: (context) => Screen1());
        case '/screen2':
          return MaterialPageRoute(builder: (context) => Screen2());
      }
    },
  ));
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('screen1'),
      ),
      body: Container(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/screen2');
            },
            child: Icon(Icons.not_accessible)),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('screen2'),
      ),
      body: Container(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/not');
            },
            child: Icon(Icons.not_accessible)),
      ),
    );
  }
}
