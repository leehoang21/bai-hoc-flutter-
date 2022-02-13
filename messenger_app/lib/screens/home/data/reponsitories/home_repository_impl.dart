import 'package:messenger_app/core/dartz/dartz.dart';
import '../models/user_model.dart';
import '../../domain/entities/user.dart';
import '../../../../core/core.dart';
import '../datasources/home_local_data_source.dart';
import '../datasources/home_remote_data_source.dart';
import '../../domain/reponsitories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRemoteLocalDataSource remoteDataSource;
  HomeLocalDataSource localDataSource;
  HomeRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<String?> signOut() async {
    try {
      await remoteDataSource.signOut();
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  @override
  Either<User, String> getUserInfo() {
    User? user = UserModel.toUser(localDataSource.getUser);
    if (user == null) {
      return Error("User not found");
    }
    return Data(user);
  }
}
