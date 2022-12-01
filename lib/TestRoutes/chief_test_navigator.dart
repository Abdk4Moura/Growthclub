import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:growthclub/pages/chat.dart';
import 'package:growthclub/pages/createTask.dart';
import 'package:growthclub/pages/forgotPassword.dart';
import 'package:growthclub/pages/loginIn.dart';
import 'package:growthclub/pages/register.dart';
import 'package:growthclub/pages/signInWithPhone.dart';

import '../pages/activity.dart';
import '../pages/mainScreen.dart';
import 'Routes/starter.dart';

class TestNavigatorWidget extends StatelessWidget {
  const TestNavigatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MapEntry> pageMapping = {
      'Onboarding': OnboardingPage,
      'MainScreen': MainScreenPage,
      'Login': LoginPage,
      'Register': RegisterPage,
      'CreateTask': CreateTaskPage,
      'CallSomeone': null,
      'ActivityLog': ActivityPage,
      'Chat': ChatPage,
      'ForgotPassword': ForgotPasswordPage,
      'PhoneSignIn': SignInWithPhonePage,
    }.entries.toList();

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount: pageMapping.length,
      itemBuilder: (BuildContext context, int index) {
        final MapEntry mapEntry = pageMapping[index];
        final String text = mapEntry.key;
        final Widget pageRouting = mapEntry.value;

        return InkWell(
          onTap: () async {
            // TODO: Reconfigure the code below to fit Navigator guidelines
            await Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => pageRouting));
          },
          child: Card(
            color: Colors.green,
            child: AutoSizeText(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 30),
              minFontSize: 18,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}
