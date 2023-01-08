import 'package:flutter/material.dart';
import 'package:growthclub/typography.dart';

import '../growthron_ui.dart';

typedef VoidCallback = void Function();

SizedBox GetStartedButton({VoidCallback? callBack}) {
  return SizedBox(
      width: 350,
      height: 75,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 43, 158, 207)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
        onPressed: callBack,
        child: Text('Get started',
            style: GTheme.title2.copyWith(fontSize: 22, fontWeight: FontWeight.w300),
      ))
  );
}