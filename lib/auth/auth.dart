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
import 'package:growthclub/models/user.dart' as db;

class AuthModel extends ChangeNotifier {
  bool get isSignedIn => instance.currentUser != null;

  get instance => FirebaseAuth.instance;

  db.User get user => db.User.fromFaUser(instance.currentUser);

  String? get firstname => instance.currentUser?.displayName?.split(' ').first;

  String? get username {
    return firstname;
    throw UnimplementedError();
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

// Future updateUserDetails({String? name, String? phoneNumber, String? email, String? password, String? photoURL}) async {
//   final user_ = FirebaseAuth.instance.currentUser.updateDisplayName(displayName)
//   if (name != null) {
//     await instance.currentUser.updateDisplayName(name);
//     user.name = name;
//   }
// }
}
