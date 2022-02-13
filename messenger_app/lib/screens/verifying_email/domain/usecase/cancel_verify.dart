import 'dart:async';
import '../../../../core/core.dart';
import '../reponsitories/verify_repositories.dart';

class CancelVerify extends UseCase<Future, NoParams> {
  VerifyRepositories repositories;
  CancelVerify(this.repositories);
  @override
  Future<String?> call(NoParams params) async {
    return await repositories.cancel();
  }
}
