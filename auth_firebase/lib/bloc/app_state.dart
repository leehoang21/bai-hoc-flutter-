part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
}

class AppState extends Equatable {
  final AppStatus status;
  final User user;

  const AppState({required this.status, required this.user});

  @override
  List<Object?> get props => [status, user];
}

class Unauthenticated extends AppState {
  Unauthenticated()
      : super(
          status: AppStatus.unauthenticated,
          user: User.empty,
        );
}

class Authenticated extends AppState {
  const Authenticated(User currentUser, {required User user})
      : super(status: AppStatus.authenticated, user: user);
}
