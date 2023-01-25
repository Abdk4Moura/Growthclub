import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:growthclub/models/base_model.dart';
import 'package:growthclub/models/task.dart';

import 'room.dart';

class Club extends SyncObject {
  @override
  final String? id;
  final String name;

  // [members] identity stored as their uid
  final List<String> members;
  final CollectionReference? rooms;
  final List<Task> tasks;
  final Timestamp? creationDate;

  Club({
    this.id,
    required this.name,
    required this.members,
    required this.tasks,
    required this.rooms,
    this.creationDate,
  }) : assert(id == null && creationDate == null);

  factory Club.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    // CollectionReference r = data?['rooms'];
    //
    // var rooms = r.get().then((value) => value.docs.map(Room.fromFF).toList()) as List<Room>;

    return Club(
      name: data?['name'],
      creationDate: data?['creationDate'],
      tasks: data?['tasks'],
      members: data?['members'],
      id: snapshot.id,
      rooms: data?['rooms'],
    );
  }

  @override
  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "creationDate": creationDate,
      "tasks": tasks,
      "members": members,
      "rooms": rooms,
      if (id != null) "id": id,
    };
  }

  @override
  Future<void> sync() {
    // TODO: implement sync
    throw UnimplementedError();
  }

  @override
  // TODO: implement generatedId
  String? get _generatedId => throw UnimplementedError();
}

/* TESTS */

var clubs = [];
