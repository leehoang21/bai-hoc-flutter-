import 'package:messenger_app/core/core.dart';
import 'package:messenger_app/core/dartz/dartz.dart';
import '../reponsitories/home_repository.dart';
import '../entities/user.dart';

class GetUser implements UseCase<Either, NoParams> {
  HomeRepository repository;

  GetUser(this.repository);
  @override
  Either<User, String> call(params) {
    return repository.getUserInfo();
  }
}
