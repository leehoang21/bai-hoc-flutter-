import 'package:cloud_firestore/cloud_firestore.dart';

class TodoRepository {
  final userCollection = FirebaseFirestore.instance.collection("User");

  get userQuery async => await userCollection.get();
}
