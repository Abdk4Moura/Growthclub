import 'package:cloud_firestore/cloud_firestore.dart';

import 'message.dart';
import 'user.dart';


class Room {
  final String name;
  final List<Message?> messages;
  final List<User?> users;
  final String? id;

  Room({required this.name, this.messages, this.id, this.users});

  factory Room.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Room(
        name: data?['name'],
        messages: data?['email'],
        id: data?['id'],
        users: data?['users'],
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