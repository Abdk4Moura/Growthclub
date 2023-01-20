import 'package:cloud_firestore/cloud_firestore.dart';

import 'club.dart';
import 'user.dart';

CollectionReference USERS = FirebaseFirestore.instance.collection('users');
CollectionReference? MESSAGES;

// complaints(String id) =>
// FirebaseFirestore.instance.collection('complaints').doc(id).withConverter(fromFirestore: fromFirestore, toFirestore: toFirestore)

DocumentReference<User> users(String id) =>
    FirebaseFirestore.instance.collection('users').doc(id).withConverter(
        fromFirestore: User.fromFirestore,
        toFirestore: (User user, _) => user.toFirestore());

DocumentReference<Club> clubs(String id) =>
    FirebaseFirestore.instance.collection('clubs').doc(id).withConverter(
        fromFirestore: Club.fromFirestore,
        toFirestore: (Club club, _) => club.toFirestore());

chatRooms({required String clubId, required String roomId}) =>
    clubs(clubId).collection(roomId);
