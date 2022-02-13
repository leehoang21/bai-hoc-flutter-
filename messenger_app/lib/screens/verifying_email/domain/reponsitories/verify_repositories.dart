import 'dart:async';

import 'package:messenger_app/core/core.dart';

abstract class VerifyRepositories {
  Future sendEmailVerification();
  Future<Either<bool, String?>> checkEmailVerified();
  Future<String?> cancel();
}
