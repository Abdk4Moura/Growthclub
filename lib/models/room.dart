import 'package:cloud_firestore/cloud_firestore.dart';

import 'message.dart';
import 'user.dart';

class Room {
  final String name;
  final List<Message>? messages;
  final List<User>? users;
  final String? id;
  final bool unread;
  final CollectionReference? parentReference;
  final DocumentReference? reference;

  const Room(
      {required this.name,
      this.messages = const [],
      this.id,
      this.users = const [],
      this.unread = true,
      this.parentReference,
      this.reference});

  factory Room.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Room(
      name: data?['name'],
      messages: data?['messages'],
      id: snapshot.id,
      users: data?['users'],
    );
  }

  factory Room.fromFF(QueryDocumentSnapshot doc) {
    final id = doc.id;
    var data = doc.data() as Map;

    final reference = doc.reference;
    final parentReference = reference.parent;

    return Room(
      name: data['name'],
      messages: data['messages'],
      id: id,
      users: data['users'],
      parentReference: parentReference,
      reference: reference
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      if (messages != null) "messages": messages,
      if (users != null) "users": users,
      if (id != null) "id": id,
    };
  }
}
