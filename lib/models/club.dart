import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:growthclub/models/base_model.dart';
import 'package:growthclub/models/task.dart';
import 'package:growthclub/models/user.dart';

class Club extends SyncObject {
  @override
  final String? id;
  final String name;

  // [members] identity stored as their uid
  final Set<String> members;
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

  factory Club.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,) {
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

  factory Club.fromMap(Map<String, dynamic> data) {
    //<editor-fold desc="I do not seem to understand what happened here">
    // var map = data.entries.toSet().where((element) => false);
    // if (data.containsKey('id'))
    //   var id = data['id'];
    //</editor-fold>

    return Club(
      name: data['name'],
      creationDate: data['creationDate'],
      tasks: data['tasks'],
      members: data['members'],
      rooms: data['rooms'],
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

Future<void> pushInstantaneouslyForClubs(List<Club> club) async {
  // Map<String, dynamic> prevClubMapData = (await FirebaseFirestore
  //     .instance.collection('clubs')
  //     .where('name', isEqualTo: club.name)
  //     .get()).docs.first.data();
  for (var club in clubs) {
    await FirebaseFirestore.instance.collection('clubs').add(club.toFirestore());
  }
}


/* TESTS */
// create 5 dummy clubs in a list
List<Club> clubs = [];
User john = User(
  name: 'John',
  email: 'john@email.com',
  phoneNumber: '+123456789',
  clubs: null,
  createdDate: Timestamp.now(),
);

User jerry = User(
  name: 'Jerry',
  email: 'jerry@gmail.com',
  phoneNumber: '+987654321',
  clubs: null,
  createdDate: Timestamp.now(),
);

User tom = User(
  name: 'Tom',
  email: 'tom@gmail.com',
  phoneNumber: '+123456789',
  clubs: null,
  createdDate: Timestamp.now(),
);

List<User> users = [john, jerry, tom];

void test () {
  var clubNames = ['HelloClub', 'JapaGeng', 'Home Away', 'Dostoevsky Book Club', ];
  for (String clubName in clubNames) {
    clubs.add(Club(
      name: clubName,
      creationDate: Timestamp.now(),
      tasks: [],
      members: {},
      rooms: null,
    ));
  }
}