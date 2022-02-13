import '../reponsitories/home_repository.dart';
import '../../../../core/core.dart';

class SignOut implements UseCase<Future, NoParams> {
  HomeRepository repository;

  SignOut(this.repository);

  @override
  Future<String?> call(NoParams params) async {
    return await repository.signOut();
  }
}
