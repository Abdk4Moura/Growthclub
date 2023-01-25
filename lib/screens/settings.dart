import 'package:flutter/material.dart';
import 'package:growthclub/auth/auth.dart';
import 'package:growthclub/components/base_components.dart';
import 'package:growthclub/screens/chat_screen.dart';
import 'package:growthclub/typography.dart';
import 'package:provider/provider.dart';

import 'chat_home_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authModel = Provider.of<AuthModel>(context);
    var user = authModel.user;

    return Scaffold(
      key: key,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 5,
          title: const Text('Settings'),
          centerTitle: true,
          leading: const Icon(Icons.settings),
          leadingWidth: 100,
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ]),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(32.0, 10, 32.0, 5.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          settingViewButton(context, text: 'chat', onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const Chats()));
          }),
          settingViewButton(context, text: 'dialog', onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) => leaveTheClub(context));
          })
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          elevation: 0,
          child: Row(
            children: const [Text('Nothing')],
          )),
    );
  }
}

Widget settingViewButton(
  BuildContext context, {
  required String text,
  required Function() onPressed,
}) {
  Color color = GTheme.primaryButtonColor;
  FontWeight fW = FontWeight.w300;

  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: TextButton(
      onFocusChange: (k) {
        // TODO: not functioning
        if (color == GTheme.primaryButtonColor) {
          color = GTheme.primaryButtonHoverColor;
          fW = FontWeight.w500;
        } else {
          color = GTheme.primaryButtonColor;
          fW = FontWeight.w300;
        }
      },
      onPressed: onPressed,
      child: Text(text,
          style: GTheme.subtitle1.copyWith(color: color, fontWeight: fW)),
    ),
  );
}
