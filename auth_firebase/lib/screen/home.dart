import 'package:auth_firebase/authentication_service/authentication_service.dart';
import 'package:auth_firebase/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static MaterialPage page() {
    return const MaterialPage(
      child: Home(),
    );
  }

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    final user = context.select((AppBloc appBloc) => appBloc.state.user);
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user.name.toString()),
            SizedBox.square(
              dimension: 100,
              child: user.photo != null
                  ? Image.network(user.photo!)
                  : const Icon(Icons.person),
            ),
            Text(user.id),
            // Nút đăng xuất
            ElevatedButton(
              onPressed: context.read<AuthenticationSerivce>().signOut,
              child: const Text("Log Out"),
            )
          ],
        ),
      ),
    );
  }
}
