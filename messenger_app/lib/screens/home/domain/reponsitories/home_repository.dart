import 'package:messenger_app/core/core.dart';
import 'package:messenger_app/core/dartz/dartz.dart';
import '../entities/user.dart';

abstract class HomeRepository {
  Future<String?> signOut();

  Either<User, String> getUserInfo();
}
