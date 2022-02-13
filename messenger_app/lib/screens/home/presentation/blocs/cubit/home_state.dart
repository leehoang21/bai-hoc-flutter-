part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  final User? user;
  final String? error;
  const HomeState({this.user, this.error});

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial() : super();
}

class UserLoaded extends HomeState {
  const UserLoaded({required User user, required String? error})
      : super(user: user, error: error);
}

class LogOutSuccess extends HomeState {}

class LogOutLoading extends HomeState {}

class LogOutError extends HomeState {
  const LogOutError({required String error}) : super(error: error);
}
