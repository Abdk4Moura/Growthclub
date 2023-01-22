import 'package:cloud_firestore/cloud_firestore.dart'
    show
        CollectionReference,
        DocumentSnapshot,
        FirebaseFirestore,
        SnapshotOptions,
        Timestamp;
import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:growthclub/assets_names.dart';
import '/models/base_model.dart';
import '/models/util.dart';


CollectionReference _users = FirebaseFirestore.instance.collection('users');

// TODO: add @Immutable label
class User extends DBObject {
  String? _name;
  String? _email;
  String? _phoneNumber;
  Set<String>? clubs;
  late final Timestamp? createdDate;
  @override
  String? id;
  String? _imageUrl;

  // TODO: User to be remade a constant class
  User(
      {String? name,
      String? email,
      String? phoneNumber,
      this.clubs,
      Timestamp? createdDate,
      String? id,
      String imageUrl = defaultIconImage})
      : assert(email != null || phoneNumber != null,
            'either `phoneNumber` or `email` must be existent')
  // TODO: if user does not have a name, prompt --> completed in the InfoPage.
  {
    this.name = name;
    this.email = email;
    this.phoneNumber = phoneNumber;
    this.imageUrl = imageUrl;

    this.createdDate = createdDate ?? Timestamp.now();

    if (id != null) this.id = id;
    log();
  }

  static fromUID(String id) async {
    final userSnapshot = await users(id).get();

    User? user = userSnapshot.data();
    return user;
  }

  static get currentUser => User.currentUser_();

  bool nameHasChanged = false;

  String? get name => _name;

  set name(String? newName) {
    _name = newName;
    nameHasChanged = true;
  }

  bool emailHasChanged = false;

  String? get email => _email;

  set email(String? newEmail) {
    _email = newEmail;
    emailHasChanged = true;
  }

  String? get phoneNumber => _phoneNumber;

  bool phoneNumberHasChanged = false;

  set phoneNumber(String? newPhoneNumber) {
    _phoneNumber = newPhoneNumber;
    phoneNumberHasChanged = true;
  }

  bool imageUrlHasChanged = false;

  String? get imageUrl => _imageUrl;

  set imageUrl(String? newImageUrl) {
    _imageUrl = newImageUrl;
    imageUrlHasChanged = true;
  }

  @override
  Future<void> log(
      {bool isUpdating = false,
      fa.PhoneAuthCredential? phoneAuthCredential,
      String? password}) async {
    var user = fa.FirebaseAuth.instance.currentUser;
    if (user == null) throw Error();
    if (user.uid != id) {
      throw Error();
    }
    ;
    if (isUpdating && id == null) {
      throw SemanticUpdateContradictionError(toString());
    }

    var toF = toFirestore();
    if (isUpdating) {
      assert(id != null);
      _group.doc(id).update(toF);
    } else {
      _group.add(toF).then((value) {
        id = value.id;
      });
    }

    if (nameHasChanged) {
      user.updateDisplayName(name);
      nameHasChanged != nameHasChanged;
    }
    if (emailHasChanged) {
      user.updateEmail(email!);
      emailHasChanged != emailHasChanged;
    }
    if (phoneNumberHasChanged && phoneAuthCredential != null) {
      user.updatePhoneNumber(phoneAuthCredential);
      phoneNumberHasChanged != phoneNumberHasChanged;
    }
    if (imageUrlHasChanged) {
      user.updatePhotoURL(imageUrl);
      imageUrlHasChanged != imageUrlHasChanged;
    }
    if (password != null) user.updatePassword(password);
  }

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
        clubs: data?['clubs']);
  }

  @override
  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (phoneNumber != null) "phoneNumber": phoneNumber,
      if (id != null) "id": id,
      if (clubs != null) "clubs": clubs
    };
  }

  @override
  String get _generatedId {
    String parseInput = name as String;
    if (email != null) {
      parseInput += email as String;
    }
    // if (password != null) {
    //   parseInput += password as String;
    // }
    if (createdDate != null) {
      parseInput += Timestamp.now().seconds.toString();
    }
    return checksum(parseInput);
  }

  @override
  final CollectionReference<Object?> _group = _users;

  @override
  bool get _withRandomId => true;

  static void validateName(String name) {}

  static void validatePhone(String phoneNumber) {}
}
