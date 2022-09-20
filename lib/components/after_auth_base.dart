import 'package:flutter/material.dart';

import '../assets_names.dart';

class BasePage extends StatelessWidget {
  const BasePage({required this.body, Key? key}) : super(key: key);
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: body,
        bottomNavigationBar: const BottomAppBar(child: ButtonBarWidget()));
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
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white)),
            child: Image.asset(testHomeIcon, fit: BoxFit.contain),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
