import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_store/reponsitory.dart';
import 'package:firebase_store/todomodel.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              TodoRepository().addTodo(Todo());
            },
            child: const Text(''),
          ),
        ),
      ),
    );
  }
}
