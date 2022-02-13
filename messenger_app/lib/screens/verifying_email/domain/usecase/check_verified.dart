import 'package:messenger_app/core/core.dart';
import '../reponsitories/verify_repositories.dart';

class CheckVerify extends UseCase<Future, NoParams> {
  VerifyRepositories repositories;
  CheckVerify(this.repositories);

  @override
  Future<Either<bool, String?>> call(NoParams params) async {
    return await repositories.checkEmailVerified();
  }
}
