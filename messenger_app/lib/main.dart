import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_app/config/rotes/app_router.dart';
import 'package:messenger_app/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(411, 820),
        builder: () {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.signup,
            onGenerateRoute: AppRouter.generateRoute,
          );
        });
  }
}
