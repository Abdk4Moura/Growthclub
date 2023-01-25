import 'package:flutter/material.dart';
import 'package:growthclub/auth/auth.dart';
import 'package:growthclub/typography.dart';
import 'package:provider/provider.dart';

// import '/widgets/category_selector.dart';
import '../models/club.dart';
import '../models/room.dart';
import '/widgets/rooms.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DBModel(),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.menu),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {}),
          title: const Center(
            child: Text(
              'Chats',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.search),
                iconSize: 30.0,
                color: Colors.white,
                onPressed: () {}),
          ],
        ),
        body: Column(
          children: <Widget>[
            // CategorySelector(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    // const FavouriteContacts(),
                    Consumer<DBModel>(
                        builder: (context, db, child) => FutureBuilder(
                              future: db.clubRooms(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (snapshot.hasError) {
                                  return Center(
                                      child: Text(
                                          'there was an error: $snapshot.error',
                                          style: GTheme.title1.copyWith(
                                            color: Colors.red,
                                          )));
                                }
                                if (snapshot.hasData) {
                                  List<Room> rooms = snapshot.data;
                                  return Rooms(rooms: rooms);
                                }
                                if (snapshot.hasError) {
                                  // TODO: Error display widget
                                  return Expanded(
                                      child: Center(
                                    child: Text(
                                        'Unable to get resource: ${snapshot.error}',
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).errorColor)),
                                  ));
                                }
                                else {
                                  return Expanded(
                                      child: Center(
                                    child: Text('Loading ...',
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).errorColor)),
                                  ));
                                }
                              },
                            )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
