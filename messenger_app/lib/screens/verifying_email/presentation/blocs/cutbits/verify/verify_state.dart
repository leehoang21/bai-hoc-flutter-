part of 'verify_cubit.dart';

abstract class VerifyState extends Equatable {
  final bool isSuccess;
  final String? error;

  const VerifyState({this.isSuccess = false, this.error});
  @override
  List<Object?> get props => [];
}

class VerifyInitial extends VerifyState {}

class VerifyLoading extends VerifyState {
  const VerifyLoading(bool isSuccess) : super(isSuccess: isSuccess);
}

class VerifyError extends VerifyState {
  const VerifyError(String? error) : super(error: error);
}
