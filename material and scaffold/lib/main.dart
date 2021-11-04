import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'material apps',
      home: Scaffold(
        appBar: AppBar(
          bottom: AppBar(
            centerTitle: true,
            title: const Text('bottom'),
          ),
          centerTitle: true,
          title: const Text(
            ' AppBar',
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          leading: const Icon(
            Icons.access_alarm_sharp,
          ),
          actions: const [
            Icon(Icons.ac_unit),
            Icon(Icons.ac_unit),
            Icon(Icons.ac_unit),
          ],
        ),
        drawer: const Drawer(
          child: Center(
            child: Text(
              'Drawer',
              style: TextStyle(
                fontSize: 50,
              ),
            ),
          ),
        ),
        endDrawer: Drawer(
            child: Column(
          children: const [
            Icon(
              Icons.account_balance_wallet,
            ),
            Icon(
              Icons.account_balance_wallet,
            ),
            Icon(
              Icons.account_balance_wallet,
            ),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
          ),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const BottomAppBar(
          child: Text(
            ' BottomAppBar',
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          color: Colors.amber,
        ),
      ),
    );
  }
}
