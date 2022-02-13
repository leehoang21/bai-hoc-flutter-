// Thêm thư viện equatable
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String? user;
  final String? email;
  final String? photo;

  const User({
    required this.id,
    this.user,
    this.email,
    this.photo,
  });

  static User get empty => const User(id: '');

  bool get isEmpty => this == empty;

  bool get isNotEmpty => !isEmpty;

  @override
  List<Object?> get props => [id, user, email, photo];
}
