import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:messenger_app/core/core.dart';
import '../../../../domain/usecase/check_verified.dart';
import '../../../../domain/usecase/send_email_verify.dart';
import '../../../../domain/usecase/cancel_verify.dart';
part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  SendEmailVerify sendEmailVerify;
  CheckVerify checkVerify;
  CancelVerify cancelVerify;

  VerifyCubit(
      {required this.cancelVerify,
      required this.checkVerify,
      required this.sendEmailVerify})
      : super(VerifyInitial());

  Future<void> send() async {
    final Either<bool, String?> send = await sendEmailVerify(NoParams());
    if (send.error != null) {
      emit(VerifyError(send.error));
    }
  }

  Future<void> checkVeriied() async {
    Either<bool, String?> _check = await checkVerify(NoParams());
    if (_check.error != null) {
      emit(VerifyError(_check.error));
    }
    if (_check.data!) {
      emit(const VerifyLoading(true));
    }
  }
}
