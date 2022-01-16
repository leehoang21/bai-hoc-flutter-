import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Todo extends Equatable {
  // id của Todo, id này là duy nhất cho mỗi Todo và sẽ được sử dụng để truy
  // vân vào Todo trên database
  final String id;
  // tên
  final String name;
  // ghi chú
  final String email;
  // đánh dấu hoàn thành
  final String photo;

  Todo({
    String? id,
    this.name = "",
    this.email = "",
    this.photo = '',
  }) : id = id ?? const Uuid().v4();

  Todo copyWith({
    String? id,
    String? name,
    String? email,
    String? photo,
  }) {
    return Todo(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      photo: photo ?? this.photo,
    );
  }

  // convert model sang Document để đẩy lên database
  // Lưu ý: vì mỗi document đã có sẵn ID nên không cần thêm trường ID nữa
  Map<String, dynamic> toDocument() {
    return {
      'name': name,
      'email': email,
      'photo': photo,
    };
  }

  // convert từ Document sang model
  factory Todo.fromDocument(DocumentSnapshot snapshot) {
    if (snapshot.data() == null) {
      throw Exception;
    }
    final data = snapshot.data() as Map<String, dynamic>;
    return Todo(
      id: snapshot.id,
      name: data["name"],
      email: data["email"],
      photo: data["photo"],
    );
  }

  // Convert từ Map sang model
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json["id"] as String,
      name: json["name"] as String,
      email: json["email"] as String,
      photo: json["photo"] as String,
    );
  }

  // các hàm bổ trợ
  @override
  List<Object?> get props => [id, name, email, photo];
}
