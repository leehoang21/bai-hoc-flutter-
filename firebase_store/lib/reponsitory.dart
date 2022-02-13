import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_store/todomodel.dart';

class TodoRepository {
  final todoCollection = FirebaseFirestore.instance.collection("todos");

  Stream<List<Todo>> get todos {
    return todoCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Todo.fromDocument(doc);
      }).toList();
    });
  }

  Future<void> addTodo(Todo todo) {
    return todoCollection.add(todo.toDocument());
  }

  Future<void> updateTodo(Todo todo) {
    return todoCollection.doc(todo.id).update(todo.toDocument());
  }

  Future<void> deleteTodo(Todo todo) {
    return todoCollection.doc(todo.id).delete();
  }
}
