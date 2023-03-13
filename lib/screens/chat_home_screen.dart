import 'package:flutter/foundation.dart';
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
              color: Colors.black,
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
                color: Colors.black,
                onPressed: () {}),
          ],
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // CategorySelector(),
              Consumer<DBModel>(
                  builder: (context, db, child) => FutureBuilder(
                        future: db.clubRooms(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (kDebugMode) {
                            print(
                                'snapshot state: ${snapshot.connectionState}');
                            print('snapshot.hasData: ${snapshot.hasData}');
                            print('snapshot.data: ${snapshot.data}');
                            print('snapshot.hasError: ${snapshot.hasError}');
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasData) {
                              List<Room>? rooms = snapshot.data;

                              return rooms != null
                                  ? Expanded(child: Rooms(rooms: rooms))
                                  : _buildError(context,
                                      text: 'non-existent document requested!');
                            } else {
                              if (kDebugMode) {
                                print(
                                    'Unable to get resource: ${snapshot.error}');
                              }
                              // TODO: Error display widget
                              return _buildError(context,
                                  text:
                                      'Error!\nerror type: ${snapshot.error}');
                            }
                          } else {
                            return Center(
                              child: Text('Loading ...',
                                  style: TextStyle(
                                      color: Theme.of(context).errorColor)),
                            );
                          }
                        },
                      ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context, {required String text}) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width / (1.5),
      height: 200,
      decoration: BoxDecoration(
          color: const Color(0xf9ddc9ff),
          gradient: RadialGradient(colors: [
            Colors.black.withOpacity(0.3),
            Colors.red.withOpacity(0.2),
            Colors.white.withOpacity(1.0)
          ], center: Alignment.center, radius: 10, tileMode: TileMode.clamp),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: ListView(
        children: [Center(
          child: Text(text,
              style: GTheme.subtitle1.apply(color: const Color(0xFFDC6C40))), // Theme.of(context).errorColor
        )],
      ),
    );
  }
}
