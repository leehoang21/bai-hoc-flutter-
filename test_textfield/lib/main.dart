import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  var _formKey = GlobalKey<FormState>();
  String? _errorText;
  TextEditingController myControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: _formKey,
              child: TextFormField(
                validator: (value) {
                  if (value!.length != 3) {
                    return ' so ki tu phai = 3';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                  hintText: 'Enter Your Name',
                  icon: Icon(Icons.people),
                ),
              ),
            ),
          ),
          ElevatedButton(
            child: const Text('Sign In'),
            onPressed: () {
              setState(() {
                _formKey.currentState!.validate();
              });
            },
          )
        ],
      ),
    );
  }
}
