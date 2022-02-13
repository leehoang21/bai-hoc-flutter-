import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:messenger_app/core/core.dart';
import 'package:messenger_app/core/dartz/dartz.dart';
import '../../../domain/usecase/sign_out.dart';
import '../../../domain/usecase/get_user.dart';
import '../../../domain/entities/user.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  GetUser getUser;
  SignOut signOut;
  HomeCubit({required this.getUser, required this.signOut})
      : super(const HomeInitial()) {
    Either<User, String> _user = getUser(NoParams());
    emit(
      UserLoaded(
        user: _user.data!,
        error: _user.error,
      ),
    );
  }

  Future<void> logout() async {
    emit(LogOutLoading());
    final _error = await signOut(NoParams());
    if (_error == null) {
      emit(LogOutSuccess());
    } else {
      emit(LogOutError(error: _error));
    }
  }
}
