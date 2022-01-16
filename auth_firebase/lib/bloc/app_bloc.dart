import 'dart:async';
import '/authentication_service/authentication_service.dart';
import '/authentication_service/src/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthenticationSerivce _authenticationSerivce;
  late final StreamSubscription<User> _userSubscription;

  AppBloc({required AuthenticationSerivce authenticationSerivce})
      : _authenticationSerivce = authenticationSerivce,
        super(
          authenticationSerivce.currentUser.isNotEmpty
              ? Authenticated(authenticationSerivce.currentUser,
                  user: User.empty)
              : Unauthenticated(),
        ) {
    _userSubscription = _authenticationSerivce.user.listen((user) {
      add(AppUserChanged(user));
    });

    on<AppUserChanged>(_appUserChanged);

    on<LogOutRequested>(_logOutRequested);
  }

  // Xử lí event AppUserChanged
  FutureOr<void> _appUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    emit(event.user.isEmpty
        ? Unauthenticated()
        : Authenticated(event.user, user: User.empty));
  }

  // Xử lí event LogOutRequested
  FutureOr<void> _logOutRequested(
      LogOutRequested event, Emitter<AppState> emit) async {
    unawaited(_authenticationSerivce.signOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
