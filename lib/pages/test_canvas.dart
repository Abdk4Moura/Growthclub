import 'package:firebase_core_web/firebase_core_web_interop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growthclub/typography.dart';

import 'mainScreen.dart';

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

class GrowthronSubMenu extends StatelessWidget {
  const GrowthronSubMenu(
      {Key? key,
      required this.headingText,
      required this.list,
      this.hasAddButtonBeside})
      : super(key: key);
  final String headingText;
  final List<Widget> list;
  final bool? hasAddButtonBeside;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GrowthronSubHeading(
          headingText,
          hasAddButton: hasAddButtonBeside == null ? false : true,
        )
      ].followedBy(list).toList(),
    );
  }
}

class GrowthronSubHeading extends StatelessWidget {
  const GrowthronSubHeading(this.text,
      {Key? key, this.style, required this.hasAddButton})
      : super(key: key);
  final String text;
  final TextStyle? style;
  final bool hasAddButton;
  @override
  Widget build(BuildContext context) {
    var _style = style;
    _style ??= GTheme.title2;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: _style,
          textAlign: TextAlign.left,
        ),
        Container(
          child: hasAddButton
              ? Card(
                  color: Colors.white,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: const CircleBorder(
                      side: BorderSide(width: 2, color: _iconGrey)),
                  child: IconButton(
                    color: _iconGrey,
                    icon: const Icon(FontAwesomeIcons.plus),
                    onPressed: () {},
                  ))
              : Container(),
        )
      ],
    );
  }
}

const Color _iconGrey = Color(0x566E6E6E);
