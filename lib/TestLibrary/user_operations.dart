import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:growthclub/models/util.dart' as util_;
import '../models/club.dart' as club_;
import '../models/user.dart' as user_;

Future<void> log() async {
  for (var user in club_.users) {
    await user.log();
  }
}

Future<void> displayAllUsers() async {
  List users = (await util_.USERS.get()).docs;
  for (var user in users) {
    Map userMap = (user.data() as Map);
    print('user: $userMap');
  }
}

Future<void> deleteDuplicateEntries() async {
  var listToManage = await util_.USERS.get();

  Set seen = {};
  for (var element in listToManage.docs) {
    Map<String, dynamic>? userData =
        (element as QueryDocumentSnapshot<Map<String, dynamic>>).data();
    if (seen.contains(userData['email'])) element.reference.delete();
    seen.add(userData['email']);
  }
}

Future<void> displayUserInfo(String uid) async {
  user_.User? user = (await util_.users(uid).get()).data();
  print('user: $user');
}

Future<void> addUserToClub(String uid, String clubId) async {
  user_.User? user = (await util_.users(uid).get()).data();
  if (user == null) throw StateError('user is null');
  user.clubs ??= {};
  user.clubs!.add(clubId);
  await user.log(isUpdating: true);
  await util_.clubs(clubId).update({
    'users': FieldValue.arrayUnion([uid])
  });
}

Future<void> removeUserFromClub(String uid, String clubId) async {
  user_.User? user = (await util_.users(uid).get()).data();
  if (user == null) throw StateError('user is null');
  user.clubs ??= {};
  if (user.clubs!.isEmpty) throw StateError('cannot remove from empty set');

  user.clubs!.remove(clubId);
  await user.log(isUpdating: true);
  await util_.clubs(clubId).update({
    'users': FieldValue.arrayRemove([uid])
  });
}

Future<void> sendMessageToClubRoom(String uid, String clubId, String roomId,
    String message) async {
  user_.User? user = (await util_.users(uid).get()).data();
  if (user == null) throw StateError('user is null');
  user.clubs ??= {};
  if (!user.clubs!.contains(clubId)) throw StateError('user is not in club');

  await util_.clubs(clubId).collection('rooms').doc(roomId).update({
    'messages': FieldValue.arrayUnion([
      {
        'sender': uid,
        'message': message,
        'timestamp': DateTime.now().millisecondsSinceEpoch
      }
    ])
  });
}

// TODO: // Interdependent collections (users, clubs, rooms, etc.)