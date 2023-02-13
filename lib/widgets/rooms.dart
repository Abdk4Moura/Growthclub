import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/room.dart' as r;
import '../screens/chat_screen.dart';

class Rooms extends StatelessWidget {
  final List<r.Room> rooms;

  const Rooms({super.key, required this.rooms});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: ListView.builder(
            itemCount: rooms.length,
            itemBuilder: (BuildContext context, int index) {
              final room = rooms[index];
              return RoomItem(room: room);
            },
          ),
        ),
      ),
    );
  }
}

class RoomItem extends StatefulWidget {
  const RoomItem({
    Key? key,
    required this.room,
  }) : super(key: key);

  final r.Room room;

  @override
  State<RoomItem> createState() => _RoomItemState();
}

class _RoomItemState extends State<RoomItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        CollectionReference parentClub = widget.room.parentReference!;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatScreen(
              room: widget.room,
            ),
          ),
        );

        await parentClub.doc(widget.room.id).update({'unread' : false});
      },
      child: Container(
          margin: const EdgeInsets.only(
              top: 5.0, bottom: 5.0, right: 20.0),
          padding: const EdgeInsets.symmetric(
              horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
              color: widget.room.unread
                  ? const Color(0xFFFFEFEE)
                  : Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Icon(Icons.numbers),
                  const SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.room.name,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      SizedBox(
                        width:
                            MediaQuery.of(context).size.width * 0.45,
                        child: Text(
                          widget.room.name,
                          style: const TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    widget.room.name,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  widget.room.unread
                      ? Container(
                          width: 40.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'NEW',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : const Text(''),
                ],
              ),
            ],
          ),
      )
    );
  }
}
