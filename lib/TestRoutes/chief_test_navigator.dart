import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TestNavigatorWidget extends StatelessWidget {
  const TestNavigatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      children: [
        for (int i = 0; i < 8; i++)
          const Card(
            color: Colors.green,
            child: AutoSizeText(
              'A really long String',
              style: TextStyle(color: Colors.white, fontSize: 30),
              minFontSize: 18,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    );
  }
}
