import 'package:equatable/equatable.dart';

class User extends Equatable {
  // uid của người dùng
  final String id;
  // tên người dùng nếu có
  final String? name;
  // email người dùng nếu có
  final String? email;
  // ảnh người dùng nếu có
  final String? photo;

  const User({
    required this.id,
    this.name,
    this.email,
    this.photo,
  });

  @override
  List<Object?> get props => [id, name, email, photo];
}
