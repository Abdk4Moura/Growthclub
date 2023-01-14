import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:growthclub/models/base_model.dart';

class Task extends SyncObject {
  @override
  final String? id;
  final String? text;
  final Timestamp creationDate;
  final Timestamp dueDate;

  Task(
      {required this.text,
      this.id,
      required this.creationDate,
      required this.dueDate});

  factory Task.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Task(
      text: data?['text'],
      creationDate: data?['creationDate'],
      dueDate: data?['dueDate'],
      id: data?['id'],
    );
  }

  @override
  Map<String, dynamic> toFirestore() {
    return {
      "text": text,
      "creationDate": creationDate,
      "dueDate": dueDate,
      if (id != null) "id": id,
    };
  }

  @override
  Future<void> sync() {
    // TODO: implement sync
    throw UnimplementedError();
  }
}
