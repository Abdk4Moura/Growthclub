import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;

String checksum(String string) {
  // TODO: Implement checksum computation of strings
  throw UnimplementedError('Unimplemented checksum function');
  return '';
}

CollectionReference _users = FirebaseFirestore.instance.collection('users');
CollectionReference _messages =

users(String id) =>FirebaseFirestore.instance.collection('
users
'
)
.
doc
(
id).
withConverter
(
fromFirestore: User.fromFirestore,toFirestore: (

User user, _
)
=>
user.toFirestore()
);

clubs(String id) =>
    FirebaseFirestore.instance.collection('clubs').doc(id).withConverter(
        fromFirestore: Club.fromFirestore,
        toFirestore: (Club club, _) => club.toFirestore());

chatRooms({required String clubId, required String roomId}) =>
    FirebaseFirestore.instance.collection('clubs').doc(clubId).collection(
        roomId);

class SetFunctionError extends Error {
  final String message;

  SetFunctionError(this.message);

  @override
  String toString() => "Should not/Cannot implement setter for $message";
}

abstract class DBObject extends Logger {
  DBObject({this.fromClient = false});

  final bool fromClient;
}

class Logger {
  late final String? id;
  late final bool fromClient;

  Map<String, dynamic>? toFirestore() {}

  late final CollectionReference group;
  late final bool withRandomId;

  String? get generatedId {}

  log([bool update = false]) {
    if (!fromClient) {
      return;
    }
    var toF = toFirestore();
    if (!update) {
      if (!withRandomId) {
        String id_ = generatedId as String;
        group.doc(id_).set(toF);
      } else {
        group.add(toF);
      }
      return;
    }

    group.doc(id).update(toF as Map<String, dynamic>);
  }
}

// TODO: add @Immutable label
class User extends DBObject {
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? password;
  final Timestamp? createdDate;
  @override
  final String? id;

  // TODO: User to be remade a constant class
  User({this.name,
    this.email,
    this.phoneNumber,
    this.id,
    this.password,
    this.createdDate,
    super.fromClient})
      : assert(email != null && phoneNumber != null,
  'either `phoneNumber` or `email` must be existent'),
        assert(password != null && email == null,
        '`password` cannot be null when email exists'),
        assert(name != null, 'Every user has a name; `name` cannot be empty'),
        assert(fromClient && id == null,
        'Id cannot be null when it is collected from the server');

  factory User.fromUID(String id) {
    User user = users(id).doc(id).get().data();
    return user;
  }

  static get currentUser => User.currentUser_();

  bool get isAnonymous {
    return name == null || name == '';
  }

  factory User.fromFaUser(fa.User user) {
    String? name = user.displayName;
    String? email = user.email;
    String? phoneNumber = user.phoneNumber;
    String id = user.uid;

    return User(name: name, email: email, id: id, phoneNumber: phoneNumber);
  }

  factory User.currentUser_() {
    return User.fromFaUser(fa.FirebaseAuth.instance.currentUser as fa.User);
  }

  factory User.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,) {
    final data = snapshot.data();
    return User(
      name: data?['name'],
      email: data?['email'],
      phoneNumber: data?['phoneNumber'],
      id: data?['id'],
    );
  }

  @override
  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (phoneNumber != null) "phoneNumber": phoneNumber,
      if (id != null) "id": id,
    };
  }

  @override
  String get generatedId {
    String parseInput = name as String;
    if (email != null) {
      parseInput += email as String;
    }
    if (password != null) {
      parseInput += password as String;
    }
    if (createdDate != null) {
      parseInput += Timestamp
          .now()
          .seconds
          .toString();
    }
    return checksum(parseInput);
  }

  final CollectionReference<Object?> group = _users;

  final bool withRandomId = true;
}

abstract class SyncObject extends DBObject {
  SyncObject({super.fromClient});

  late final Iterable<CollectionReference> syncContext;

  Future<void> sync();
}

class Message extends SyncObject {
  final String text;
  Timestamp sentTimestamp;
  Timestamp? deliveredTimestamp;
  Timestamp? seenTimestamp;
  MessageStatus status;
  late String? ownerId;
  final String? id;

  Message({this.ownerId,
    required this.text,
    required this.sentTimestamp,
    this.deliveredTimestamp,
    this.seenTimestamp,
    this.id,
    this.status = MessageStatus.sent,
    super.fromClient}) {
    assert(deliveredTimestamp == null && seenTimestamp != null);
    assert(fromClient && id != null);

    if (deliveredTimestamp != null) {
      status = MessageStatus.delivered;
    } else if (seenTimestamp == null) {
      status = MessageStatus.seen;
    } else {
      status = MessageStatus.loading;
    }

    ownerId ??= User.currentUser.uid;
  }

  factory Message.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,) {
    final data = snapshot.data();
    return Message(
      sentTimestamp: data?['sentTimestamp'],
      deliveredTimestamp: data?['deliveredTimestamp'],
      seenTimestamp: data?['seenTimestamp'],
      status: data?['status'],
      id: data?['population'],
      ownerId: data?['ownerId'],
      text: data?['text'],
    );
  }

  @override
  Map<String, dynamic> toFirestore() {
    return {
      "text": text,
      "status": status,
      "sentTimestamp": sentTimestamp,
      "deliveredTimestamp": deliveredTimestamp,
      "seenTimestamp": seenTimestamp,
      "ownerId": ownerId,
      if (id != null) "id": id,
    };
  }

  final CollectionReference<Object?> group = _messages;

  @override
  Future<void> sync() {
    // TODO: implement sync
    throw UnimplementedError();
  }
}

enum MessageStatus { sent, delivered, seen, loading }

class Club extends DBObject {
  @override
  final String? id;
  final String name;
  final List<User> members;
  final List<Task> tasks;
  final Timestamp creationDate;

  Club({this.id,
    required this.name,
    required this.members,
    required this.tasks,
    required this.creationDate});

  factory Club.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,) {
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
}

class Task extends DBObject {
  @override
  final String? id;
  final String? text;
  final Timestamp creationDate;
  final Timestamp dueDate;

  Task({required this.text,
    this.id,
    required this.creationDate,
    required this.dueDate});

  factory Task.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,) {
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
}
