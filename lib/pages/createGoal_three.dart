import 'package:flutter/material.dart';
import 'package:growthclub/pages/createGoal_one.dart';

class Stage3 extends StatelessWidget {
  const Stage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StageBaseWidget(
      titleQuestion: 'Alrighty! How do you want to achieve this?',
      options: [
        'Skip',
        'One month',
        'Two months',
        '6 months',
      ],
    );
  }
}