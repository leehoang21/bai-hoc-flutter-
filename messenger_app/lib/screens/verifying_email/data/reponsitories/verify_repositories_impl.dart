import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messenger_app/core/core.dart';

import '../datasources/verify_remote_data_source.dart';
import '../../domain/reponsitories/verify_repositories.dart';

class VerifyRepositoriesImpl extends VerifyRepositories {
  VerifyRemoteDataSource remoteDataSource;
  VerifyRepositoriesImpl({required this.remoteDataSource});

  @override
  Future<String?> cancel() async {
    try {
      await remoteDataSource.deleteUser();
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<Either<bool, String?>> checkEmailVerified() async {
    try {
      return Data(await remoteDataSource.isEmailVerified());
    } catch (e) {
      return Error(e.toString());
    }
  }

  @override
  Future<String?> sendEmailVerification() async {
    try {
      await remoteDataSource.sendEmailVerification();
      return null;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }
}
