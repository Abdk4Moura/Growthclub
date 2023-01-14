import 'package:cloud_firestore/cloud_firestore.dart'
    show
        CollectionReference,
        DocumentSnapshot,
        FirebaseFirestore,
        SnapshotOptions,
        Timestamp;
import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:growthclub/models/base_model.dart';
import 'package:growthclub/models/util.dart';

CollectionReference _users = FirebaseFirestore.instance.collection('users');

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
  User(
      {this.name,
      this.email,
      this.phoneNumber,
      this.id,
      this.password,
      this.createdDate,
      super.fromClient})
      : assert(email != null || phoneNumber != null,
            'either `phoneNumber` or `email` must be existent'),
        assert(password != null && email != null,
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

  factory User.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
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
      parseInput += Timestamp.now().seconds.toString();
    }
    return checksum(parseInput);
  }

  @override
  final CollectionReference<Object?> group = _users;

  @override
  final bool withRandomId = true;
}
