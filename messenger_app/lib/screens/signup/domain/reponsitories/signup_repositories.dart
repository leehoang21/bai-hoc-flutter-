import 'package:messenger_app/core/core.dart';

abstract class SignUpRepositories {
  Future<String?> signUpWithEmailAndPassword(
    String email,
    String password,
    String displayName,
  );
}
