import 'package:flutter/material.dart';
import 'package:messenger_app/screens/verifying_email/presentation/views/verify.dart';
import '../../screens/home/presentation/views/home.dart';
import '../../screens/login/presentation/views/login.dart';
import '../../screens/signup/presentation/views/signup.dart';
import '../../screens/signup/presentation/widgets/rules_page.dart';

class Routes {
  static const String home = '/home';
  static const String login = '/';
  static const String signup = '/signup';
  static const String rules = '/rules';
  static const String verify = '/verify';
}

class AppRouter {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case Routes.signup:
        return MaterialPageRoute(builder: (context) => const SignUpPage());
      case Routes.rules:
        return MaterialPageRoute(builder: (context) => const RulesPage());
      case Routes.verify:
        return MaterialPageRoute(builder: (context) => const VerifyPage());
      default:
        return MaterialPageRoute(builder: (context) => const LoginPage());
    }
  }
}
