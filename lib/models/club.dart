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
  List<Room> rooms;
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

    var r = data?['rooms'];
    r = r.map(Room.fromFirestore).toList();

    return Club(
        name: data?['name'],
        creationDate: data?['creationDate'],
        tasks: data?['tasks'],
        members: data?['members'],
        id: data?['id'],
        rooms: r);
  }

  @override
  Map<String, dynamic> toFirestore() {
    List<Map<String, dynamic>?> rooms_ = [];

    for (var room in rooms) {
      rooms_.add(room.toFirestore());
    }

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

class ClubCombinator {
  final List? collections;

  const ClubCombinator([this.collections]);

  Future<ClubCombinator> add(data) async {
    final newCollections = [];
    for (final collection in collections!) {
      newCollections.add(await collection.add(data));
    }

    return ClubCombinator(newCollections);
  }

  Query<Object?> startAtDocument(DocumentSnapshot<Object?> documentSnapshot) {
    // TODO: implement startAtDocument
    throw UnimplementedError();
  }

  @override
  Query<Object?> where(Object field,
      {Object? isEqualTo,
      Object? isNotEqualTo,
      Object? isLessThan,
      Object? isLessThanOrEqualTo,
      Object? isGreaterThan,
      Object? isGreaterThanOrEqualTo,
      Object? arrayContains,
      List<Object?>? arrayContainsAny,
      List<Object?>? whereIn,
      List<Object?>? whereNotIn,
      bool? isNull}) {
    // TODO: implement where
    throw UnimplementedError();
  }

  @override
  CollectionReference<R> withConverter<R extends Object?>(
      {required FromFirestore<R> fromFirestore,
      required ToFirestore<R> toFirestore}) {
    // TODO: implement withConverter
    throw UnimplementedError();
  }
}

/* TESTS */

var clubs = [];
