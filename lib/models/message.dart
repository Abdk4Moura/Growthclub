import 'package:cloud_firestore/cloud_firestore.dart'
    show CollectionReference, DocumentSnapshot, SnapshotOptions, Timestamp;
import 'package:growthclub/models/club.dart';
import 'package:growthclub/models/user.dart' show User;

class Message {
  final String text;
  Timestamp? sentTimestamp;
  Timestamp? deliveredTimestamp;
  Timestamp? seenTimestamp;
  MessageStatus status;
  late String? ownerId;
  @override
  final String? id;

  Message({
    this.ownerId,
    required this.text,
    this.sentTimestamp,
    String? time,
    this.deliveredTimestamp,
    this.seenTimestamp,
    this.id,
    this.status = MessageStatus.sent,
  }) {
    assert(time != null && sentTimestamp == null ||
        time == null && sentTimestamp != null);
    assert(!((seenTimestamp != null || deliveredTimestamp != null) &&
        sentTimestamp == null));
    assert(deliveredTimestamp == null && seenTimestamp != null);

    final regExp = RegExp(r'^\s*(\d+):(\d+)\w([AP][M])$');
    List<dynamic> hmp = List.filled(3, null);
    if (time != null) {
      var count = 0;
      for (final match in regExp.allMatches(time)) {
        hmp[count] = int.parse(time.substring(match.start, match.end));
        count += 1;
      }
      if (hmp[-1] == 'PM') {
        if (hmp[0] == 12)
          ;
        else
          hmp[0] += 12;
      }
      var now = DateTime.now();
      sentTimestamp = Timestamp.fromDate(
          DateTime(now.year, now.month, now.day, hmp[0], hmp[1]));
    }
    Timestamp.now().toString();
    sentTimestamp ??= Timestamp.fromDate(DateTime.now());
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

  // TODO: to be removed
  @Deprecated("use of `ClubCombinator` and `group` a bad desing pattern")
  @override
  ClubCombinator get _group => const ClubCombinator();

  @override
  Future<void> sync(MessageContext messageContext) {
    // TODO: implement sync
    throw UnimplementedError();
  }

  @override
  // TODO: implement generatedId
  String? get _generatedId => throw UnimplementedError();

  bool get unread => seenTimestamp != null;

  String get time {
    var time_ = sentTimestamp!.toDate();

    if (time_ == null) {
      return '';
    }

    final int hour = time_.hour;
    final int minute = time_.minute;
    final int day = time_.day;
    final int weekday = time_.weekday;

    var after = DateTime.now().difference(time_) > const Duration(days: 7)
        ? weekday
        : '${time_.month} ${time_.day}';

    return '$hour:$minute, $after';
  }
}

class MessageContext {}

enum MessageStatus { sent, delivered, seen, loading }

/* Test the model */
// YOU - current user
final User currentUser = User(
  id: '0',
  name: 'Current User',
  imageUrl: 'assets/images/greg.jpg',
  email: 'hello@gmail.com',
  phoneNumber: '0902222343',
);

// USERS
final User greg = User(
    id: '1',
    name: 'Greg',
    imageUrl: 'assets/images/greg.jpg',
    email: 'greg@gmail.com');
final User james = User(
    id: '2',
    name: 'James',
    imageUrl: 'assets/images/james.jpg',
    email: 'james@gmail.com');
final User john = User(
    id: '3',
    name: 'John',
    imageUrl: 'assets/images/john.jpg',
    email: 'john@gmail.com');
final User olivia = User(
    id: '4',
    name: 'Olivia',
    imageUrl: 'assets/images/olivia.jpg',
    email: 'olivia@gmail.com');
final User sam = User(
    id: '5',
    name: 'Sam',
    imageUrl: 'assets/images/sam.jpg',
    email: 'sam@gmail.com');
final User sophia = User(
    id: '6',
    name: 'Sophia',
    imageUrl: 'assets/images/sophia.jpg',
    email: 'sophia@gmail.com');
final User steven = User(
    id: '7',
    name: 'Steven',
    imageUrl: 'assets/images/steven.jpg',
    email: 'steven@gmail.com');

// FAVORITE CONTACTS
List<User> favorites = [sam, steven, olivia, john, greg];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    ownerId: james.id,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
  ),
  Message(
    ownerId: olivia.id,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
  ),
  Message(
    ownerId: john.id,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
  ),
  Message(
    ownerId: sophia.id,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
  ),
  Message(
    ownerId: steven.id,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
  ),
  Message(
    ownerId: sam.id,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
  ),
  Message(
    ownerId: greg.id,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    ownerId: james.id,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
  ),
  Message(
    ownerId: currentUser.id,
    time: '4:30 PM',
    text: 'Just walked my dog. She was super duper cute. The best pupper!!',
  ),
  Message(
    ownerId: james.id,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
  ),
  Message(
    ownerId: james.id,
    time: '3:15 PM',
    text: 'All the food',
  ),
  Message(
    ownerId: currentUser.id,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
  ),
  Message(
    ownerId: james.id,
    time: '2:00 PM',
    text: 'I ate so much food today.',
  ),
];
