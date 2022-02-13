import 'package:numbertrivia/features/numbertrivia/data/models/numbertrivia_model.dart';

abstract class NumberTriviaLocalDataSource {
  /// bị bộ nhớ cache [NumberTriviaModel] đã nhận được lần cuối cùng
  /// Người dùng đã có kết nối internet.
  ///
  /// ném [cacheException] nếu không có dữ liệu được lưu trong bộ nhớ cache.
  Future<NumberTriviaModel> getLastNumberTrivia();

  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}

const cachedNumberTrivia = 'cached_number_trivia';

class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource {


  @override
  Future<NumberTriviaModel> getLastNumberTrivia() {
    final jsonString = sharedPreferences.getString(CACHED_NUMBER_TRIVIA);
    if (jsonString.isNotEmpty) {
      return Future.value(NumberTriviaModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache) {
    return sharedPreferences.setString(
      CACHED_NUMBER_TRIVIA,
      json.encode(triviaToCache.toJson()),
    );
  }
}
