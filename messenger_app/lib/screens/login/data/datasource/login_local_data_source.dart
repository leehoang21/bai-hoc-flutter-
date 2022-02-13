import 'package:messenger_app/core/cache/cache.dart';
import 'package:messenger_app/screens/login/data/model/user_model.dart';

class LoginLocalDataSource {
  static const String _userCacheKey = "user";
  CacheClient cacheClient;

  LoginLocalDataSource({required this.cacheClient});

  Future<void> cacheUser(UserModel? userTocache) async {
    cacheClient.write(_userCacheKey, userTocache);
  }
}
