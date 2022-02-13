import '../../../login/domain/entities/user.dart';
import '../../../../core/cache/cache.dart';

class HomeLocalDataSource {
  static const String _userCacheKey = "user";
  CacheClient cacheClient;

  HomeLocalDataSource({required this.cacheClient});

  User? get getUser => cacheClient.read(_userCacheKey);
}
