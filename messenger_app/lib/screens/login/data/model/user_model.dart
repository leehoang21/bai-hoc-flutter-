import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:messenger_app/screens/login/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required String id,
    String? name,
    String? email,
    String? photo,
  }) : super(id: id, name: name, email: email, photo: photo);

  static UserModel? toUser(firebase_auth.User? user) {
    return user == null
        ? null
        : UserModel(
            id: user.uid,
            email: user.email,
            photo: user.photoURL,
            name: user.displayName,
          );
  }
}
