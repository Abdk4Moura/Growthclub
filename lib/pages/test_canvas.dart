import 'package:firebase_core_web/firebase_core_web_interop.dart';
import 'package:flutter/material.dart';

class TestCanvas extends StatefulWidget {
  const TestCanvas({Key? key}) : super(key: key);

  @override
  State<TestCanvas> createState() => _TestCanvasState();
}

class _TestCanvasState extends State<TestCanvas> {
  List<String> items = [
    'Hello World',
    'something else',
    'another thing',
    'maybe another thing'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('hello, world'),
        ),
        body: Column(
          children: [
            Container(
                padding: EdgeInsets.all(5),
                height: 30,
                child: // Generated code for this ListView Widget...
                    ListView.builder(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoriesItem('#${items[index]}');
                  },
                )),
          ],
        ));
  }
}

class CategoriesItem extends StatelessWidget {
  CategoriesItem(
    this.text, {
    Key? key,
  }) : super(key: key) {
    index = _index++ % colorList.length;
  }

  final String text;
  int index = 0;
  static int _index = 0;
  static List<Color> colorList = [
    Colors.greenAccent,
    Colors.orange,
    const Color(0xcfffbeff),
    const Color(0xffffd877)
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: colorList[index],
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
