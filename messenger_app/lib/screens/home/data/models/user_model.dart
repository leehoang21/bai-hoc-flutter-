import '../../../login/domain/entities/user.dart' as login;
import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required String id,
    String? name,
    String? email,
    String? photo,
  }) : super(id: id, name: name, email: email, photo: photo);

  static UserModel? toUser(login.User? user) {
    if (user == null) {
      return null;
    } else {
      return UserModel(
        id: user.id,
        name: user.name,
        email: user.email,
        photo: user.photo,
      );
    }
  }

  static UserModel empty() => const UserModel(id: '');

  bool get isEmpty => this == empty();

  bool get isNotEmpty => !isEmpty;
}
