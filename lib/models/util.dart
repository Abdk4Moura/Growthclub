import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:growthclub/models/user.dart';

CollectionReference USERS = FirebaseFirestore.instance.collection('users');
CollectionReference? MESSAGES;

users(String id) =>
    FirebaseFirestore.instance.collection('users').doc(id).withConverter(
        fromFirestore: User.fromFirestore,
        toFirestore: (User user, _) => user.toFirestore());

clubs(String id) =>
    FirebaseFirestore.instance.collection('clubs').doc(id).withConverter(
        fromFirestore: Club.fromFirestore,
        toFirestore: (Club club, _) => club.toFirestore());

chatRooms({required String clubId, required String roomId}) =>
    FirebaseFirestore.instance
        .collection('clubs')
        .doc(clubId)
        .collection(roomId);
