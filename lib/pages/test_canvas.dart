import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growthclub/TestLibrary/components.dart';

class TestCanvas extends StatefulWidget {
  const TestCanvas({Key? key}) : super(key: key);

  @override
  State<TestCanvas> createState() => _TestCanvasState();
}

class _TestCanvasState extends State<TestCanvas> {
  List<String> items = [
    'general',
    'something else',
    'another thing',
    'maybe another thing'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'hello, world',
            style: GoogleFonts.montserrat(),
          ),
        ),
        body: Column(
          children: [
            AnimatedOpacity(
              opacity: 1,
              duration: const Duration(milliseconds: 100),
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  height: 40,
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
            ),
          ],
        ));
  }
}

class TestContainer extends StatelessWidget {
  const TestContainer({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final decoration = child != null
        ? BoxDecoration(borderRadius: BorderRadius.circular(10))
        : null;

    return Expanded(
      child: Container(
        color: child != null ? Colors.blue : null,
        decoration: decoration,
        child: child,
      ),
    );
  }
}

const Color _iconGrey = Color(0x566E6E6E);
