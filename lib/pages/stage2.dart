import 'package:flutter/material.dart';
import 'package:growthclub/pages/stage1.dart';

class Stage2 extends StatelessWidget {
  const Stage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StageBaseWidget(
      titleQuestion: 'Great! How often will you work on this goal?',
      options: [
        'Daily',
        '3 times in a week',
        '5 times a week',
        '6 times a week',
        'Once a week'
      ],
    );
  }
}
