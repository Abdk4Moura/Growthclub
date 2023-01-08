import 'package:flutter/material.dart';

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

