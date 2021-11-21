import 'package:flutter/material.dart';
import 'package:mutil_provider/man_hinh_2.dart';
import 'package:mutil_provider/provider.dart';
import 'package:provider/provider.dart';

class Man1 extends StatelessWidget {
  const Man1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('man hinh 1'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Man2(),
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_forward,
            ),
          ),
          const Icon(
            Icons.arrow_forward,
          ),
        ],
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
