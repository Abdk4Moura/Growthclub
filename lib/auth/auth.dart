import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'
    show
        FirebaseAuth,
        FirebaseAuthException,
        GoogleAuthProvider,
        OAuthCredential,
        UserCredential;
import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:google_sign_in/google_sign_in.dart'
    show GoogleSignIn, GoogleSignInAccount, GoogleSignInAuthentication;
import '/models/room.dart';
import '/models/user.dart' as db;
import '/models/util.dart' as util;

import '/models/club.dart';

class AuthModel extends ChangeNotifier {
  bool get isSignedIn => instance.currentUser != null;

  FirebaseAuth get instance => FirebaseAuth.instance;

  db.User get user => db.User.fromFaUser(instance.currentUser!);

  String? get firstname => instance.currentUser?.displayName?.split(' ').first;

  String? get username {
    return firstname;
  }

// TODO: make signInWithFacebook work actually
  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    late final OAuthCredential credential;

    // try {
    credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // } on Error {
    //   return;
    // }

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);

    // Notify Listeners of the change
    notifyListeners();
  }

  Future<UserCredential?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print('instead this error occurred instead $e');
    }
    return null;
  }
}

class DBModel extends ChangeNotifier {
  get instance => FirebaseFirestore.instance;

  baseModel(String id) => FirebaseFirestore.instance.collection('clubs');

  Future<Set<String>?> get clubs async {
    String id = db.User.currentUser_().id!;
    var userSnapshot = await util.users(id).get();

    db.User? user = userSnapshot.data();
    user = user!;

    return user.clubs;
  }

  Future<List<Room>?> rooms([String? clubId]) async {
    Club? c;
    if (clubId != null) {
      var cSnapshot = await util.clubs(clubId).get();
      c = cSnapshot.data();
    } else {
      c = await currentClub;
    }

    return c?.rooms;
  }

  String? _currentClub;

  Future<Club?> get currentClub async {
    if (_currentClub == null) {
      final c = await clubs;
      String first = c!.first;
      _currentClub = first;
    }
    DocumentSnapshot<Club> theClub = await util.clubs(_currentClub!).get();

    return theClub.data();
  }

  Room? _currentRoom;

  Room? get currentRoom {
    _currentRoom ??= rooms().then((value) => value?.first) as Room?;
    return _currentRoom;
  }

  set currentClub(club) {
    _currentClub = club;
    notifyListeners();
  }

  set currentRoom(roomId) {
    var r = rooms();
    r.then((rooms) {
      _currentRoom = rooms?.where((room) => room.id == roomId).first;
      notifyListeners();
    });
  }
}
