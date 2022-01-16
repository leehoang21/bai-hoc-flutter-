part of 'app_bloc.dart';

class AppEvent extends Equatable {
  const AppEvent();
  @override
  List<Object?> get props => [];
}

class AppUserChanged extends AppEvent {
  final User user;

  const AppUserChanged(this.user);
}

class LogOutRequested extends AppEvent {}
