import 'package:flutter/material.dart';
import 'package:mutil_provider/provider.dart';
import 'package:provider/provider.dart';

class Man2 extends StatelessWidget {
  const Man2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('man hinh 2'),
      ),
      body: Center(
        child: Text(
          context.watch<DemProvider>().dem.toString(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<DemProvider>().add();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
