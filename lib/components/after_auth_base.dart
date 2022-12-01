import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:growthclub/pages/activity.dart';
import 'package:growthclub/pages/createClub.dart';
import 'package:growthclub/pages/createGoal.dart';
import 'package:growthclub/pages/mainScreen.dart';

import '../assets_names.dart';

class BasePage extends StatelessWidget {
  const BasePage(
      {required this.body, Key? key, this.backgroundColor, this.appBar})
      : super(key: key);

  const BasePage.withAppBar({
    Key? key,
    required this.body,
    this.backgroundColor,
    this.appBar,
  }) : super(key: key);

  final AppBar? appBar;
  final Widget body;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: appBar == null ? null : bottomNavBar(context),
            appBar: appBar,
            body: appBar == null ?
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Expanded(child: body), bottomNavBar(context)]) : body)
    );
  }
}

Widget bottomNavBar(BuildContext context) => Container(
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(
        width: 1,
      ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MainScreenPage()));
            },
            color: Colors.black.withOpacity(0.8),
          ),
          IconButton(
            icon: const Icon(FontAwesomeIcons.peopleGroup),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const NewClubPage()));
            },
            color: Colors.black.withOpacity(0.8),
          ),
          IconButton(
              icon: const Icon(Icons.other_houses_outlined),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainScreenPage()));
              },
              color: Colors.black.withOpacity(0.8)),
          IconButton(
              icon: const Icon(FontAwesomeIcons.bullseye),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewGoalPage()));
              },
              color: Colors.black.withOpacity(0.8)),
          IconButton(
              icon: const Icon(Icons.person_outline),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ActivityPage()));
              },
              color: Colors.black.withOpacity(0.8)),
        ],
      ),
    );

class ButtonBarWidget extends StatelessWidget {
  const ButtonBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: ButtonBar(
        alignment: MainAxisAlignment.start,
        children: <Widget>[
          IconButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white)),
            icon: Image.asset(testHomeIcon, fit: BoxFit.contain),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
