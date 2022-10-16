import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../assets_names.dart';

class BasePage extends StatelessWidget {
  const BasePage({required this.body, Key? key}) : super(key: key);
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          body: Stack(children: [
            Positioned(top: 0,bottom: 80, child: SizedBox(width: size.width, child: body)),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: double.infinity,
                height: 80,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
                    IconButton(icon: const Icon(FontAwesomeIcons.peopleGroup), onPressed: () {}),
                    IconButton(icon: const Icon(Icons.home_filled), onPressed: () {}),
                    IconButton(icon: const Icon(FontAwesomeIcons.arrowPointer), onPressed: () {}),
                    IconButton(icon: const Icon(Icons.person_outline), onPressed: () {}),
                  ],
                ),
              )
            )
          ]))
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
            icon: Image.asset(testHomeIcon, fit: BoxFit.contain),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
