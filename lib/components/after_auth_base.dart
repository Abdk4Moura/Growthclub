import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:growthclub/auth/auth.dart';
import 'package:growthclub/growthron_ui.dart';
import 'package:growthclub/pages/activity.dart';
import 'package:growthclub/pages/createClub.dart';
import 'package:growthclub/pages/createGoal.dart';
import 'package:growthclub/pages/mainScreen.dart';
import 'package:growthclub/typography.dart';
import 'package:provider/provider.dart';

import '../assets_names.dart';
import 'base_components.dart';

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
          body: appBar == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Expanded(child: body), bottomNavBar(context)])
              : body),
    );
  }
}



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
            icon: Center(child: Image.asset(testHomeIcon, fit: BoxFit.contain)),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

