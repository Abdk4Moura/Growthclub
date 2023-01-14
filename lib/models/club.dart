import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:growthclub/models/base_model.dart';
import 'package:growthclub/models/task.dart';

class Club extends SyncObject {
  @override
  final String? id;
  final String name;

  // [members] identity stored as their uid
  final List<String> members;
  final List<Task> tasks;
  final Timestamp? creationDate;

  Club(
      {this.id,
      required this.name,
      required this.members,
      required this.tasks,
      this.creationDate,
      super.fromClient})
      : assert(id == null && creationDate == null);

  factory Club.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Club(
      name: data?['name'],
      creationDate: data?['creationDate'],
      tasks: data?['tasks'],
      members: data?['members'],
      id: data?['id'],
    );
  }

  @override
  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "creationDate": creationDate,
      "tasks": tasks,
      "members": members,
      if (id != null) "id": id,
    };
  }

  @override
  Future<void> sync() {
    // TODO: implement sync
    throw UnimplementedError();
  }
}
