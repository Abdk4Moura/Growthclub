import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:growthclub/models/base_model.dart';
import 'package:growthclub/models/user.dart';
import 'package:growthclub/models/util.dart';

class Message extends SyncObject {
  final String text;
  Timestamp sentTimestamp;
  Timestamp? deliveredTimestamp;
  Timestamp? seenTimestamp;
  MessageStatus status;
  late String? ownerId;
  @override
  final String? id;

  Message(
      {this.ownerId,
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

  factory Message.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
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

  // TODO: to be made unnullable and implemented properly
  @override
  final CollectionReference<Object?> group = MESSAGES as CollectionReference;

  @override
  Future<void> sync() {
    // TODO: implement sync
    throw UnimplementedError();
  }
}

enum MessageStatus { sent, delivered, seen, loading }

/* Test the model */
// YOU - current user
final User currentUser =
    User(id: 0, name: 'Current User', imageUrl: 'assets/images/greg.jpg');

// USERS
final User greg = User(id: 1, name: 'Greg', imageUrl: 'assets/images/greg.jpg');
final User james =
    User(id: 2, name: 'James', imageUrl: 'assets/images/james.jpg');
final User john = User(id: 3, name: 'John', imageUrl: 'assets/images/john.jpg');
final User olivia =
    User(id: 4, name: 'Olivia', imageUrl: 'assets/images/olivia.jpg');
final User sam = User(id: 5, name: 'Sam', imageUrl: 'assets/images/sam.jpg');
final User sophia =
    User(id: 6, name: 'Sophia', imageUrl: 'assets/images/sophia.jpg');
final User steven =
    User(id: 7, name: 'Steven', imageUrl: 'assets/images/steven.jpg');

// FAVORITE CONTACTS
List<User> favorites = [sam, steven, olivia, john, greg];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: olivia,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: john,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sophia,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: steven,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sam,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: greg,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Just walked my dog. She was super duper cute. The best pupper!!',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
];
