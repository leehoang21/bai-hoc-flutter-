import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Todo extends Equatable {
  // id của Todo, id này là duy nhất cho mỗi Todo và sẽ được sử dụng để truy
  // vân vào Todo trên database
  final String id;
  // tên
  final String task;
  // ghi chú
  final String note;
  // đánh dấu hoàn thành
  final bool isComplete;

  Todo({
    String? id,
    this.task = "",
    this.note = "",
    this.isComplete = false,
  }) : id = id ?? const Uuid().v4();

  Todo copyWith({
    String? id,
    String? task,
    String? note,
    bool? isComplete,
  }) {
    return Todo(
      id: id ?? this.id,
      task: task ?? this.task,
      note: note ?? this.note,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  // convert model sang Document để đẩy lên database
  // Lưu ý: vì mỗi document đã có sẵn ID nên không cần thêm trường ID nữa
  Map<String, dynamic> toDocument() {
    return {
      'task': task,
      'note': note,
      'isComplete': isComplete,
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
      task: data["task"],
      note: data["note"],
      isComplete: data["isComplete"],
    );
  }

  // Convert từ Map sang model
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json["id"] as String,
      task: json["task"] as String,
      note: json["note"] as String,
      isComplete: json["isComplete"] as bool,
    );
  }

  // các hàm bổ trợ
  @override
  List<Object?> get props => [id, task, note, isComplete];

  @override
  String toString() {
    return "Todo: {id: $id, task: $task, note: $note, isComplete: $isComplete}";
  }
}
