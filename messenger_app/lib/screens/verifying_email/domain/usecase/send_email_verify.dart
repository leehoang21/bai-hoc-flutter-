import 'package:messenger_app/core/core.dart';
import 'package:messenger_app/screens/verifying_email/domain/reponsitories/verify_repositories.dart';

class SendEmailVerify extends UseCase<Future, NoParams> {
  VerifyRepositories repositories;
  SendEmailVerify(this.repositories);

  @override
  Future call(NoParams params) async {
    return await repositories.sendEmailVerification();
  }
}
