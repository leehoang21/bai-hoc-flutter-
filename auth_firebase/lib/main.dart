import 'package:auth_firebase/appview.dart';
import 'package:auth_firebase/authentication_service/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final authenticationService = AuthenticationSerivce();

  await authenticationService.user.first;
  runApp(
    App(authenticationSerivce: authenticationService),
  );
}
