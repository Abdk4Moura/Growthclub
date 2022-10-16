import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growthclub/typography.dart';

import '../growthron_ui.dart';

class Stage1 extends StatelessWidget {
  const Stage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StageBaseWidget(
        titleQuestion: 'Which category does your goal fall?',
        others: [
          TextCheckListItem('Learning a skill/Taking a course'),
          TextCheckListItem('Working on a project e.g. building a business'),
          TextCheckListItem('Building a habit'),
          TextCheckListItem('Studying for School'),
          TextCheckListItem('Other'),
          SizedBox(
            width: 300,
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    isCollapsed: true,
                    contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  ),
                  style: GTheme.subtitle1
                      .copyWith(fontSize: 12, color: GTheme.primaryButtonColor),
                  onTap: () {},
                ),
                SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: Text('Submit',
                              style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: const Color(0xFF55C1F0))),
                          onPressed: () {},
                        )
                      ],
                    )),
              ],
            ),
          )
        ]);
  }
}

class StageBaseWidget extends StatelessWidget {
  const StageBaseWidget(
      {Key? key, required this.titleQuestion, this.options, this.others})
      : super(key: key);

  final String titleQuestion;
  final List<String>? options;
  final List<Widget>? others;

  @override
  Widget build(BuildContext context) {
    List<Widget> questionBody = [
      Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          width: 220,
          child: Text(titleQuestion, style: GTheme.subtitle2)),
      const SizedBox(height: 35),
    ];
    if (options != null) {
      Iterable<Widget> selectOptions =
          (options as List).map((value) => TextCheckListItem(value));
      questionBody.addAll(selectOptions);
    }
    if (others != null || others == []) {
      questionBody.addAll(others as List<Widget>);
    }

    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: backIconButton(context)),
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: questionBody)),
        ));
  }
}

Widget backIconButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16.0, 8, 0, 0),
    child: SizedBox(
      width: 20,
      height: 20,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: GrowthronIconButton(
          borderRadius: 5,
          buttonSize: 15,
          color: GTheme.canvasColor,
          icon: const Icon(
            size: 23,
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
      ),
    ),
  );
}

class TextCheckListItem extends StatefulWidget {
  TextCheckListItem(this.text, {Key? key, this.originalColor, this.focusColor})
      : super(key: key) {
    originalColor = originalColor ?? GTheme.TextButtonOriginalColor;
    focusColor = focusColor ?? GTheme.primaryButtonColor;
  }

  Color? originalColor;
  Color? focusColor;
  String text;

  @override
  State<TextCheckListItem> createState() => _TextCheckListItemState();
}

class _TextCheckListItemState extends State<TextCheckListItem> {
  bool _on_of = true;
  Color color = Colors.black;
  TextDecoration? decoration;

  void colorToggle() {
    if (_on_of) {
      _on_of = !_on_of;
      color = widget.focusColor as Color;
      decoration = TextDecoration.underline;
      return;
    }
    color = widget.originalColor as Color;
    decoration = null;
    _on_of = !_on_of;
  }

  @override
  Widget build(BuildContext context) {
    color = widget.originalColor as Color;
    String text = widget.text;
    if (kDebugMode) {
      print('widget.originalColor is, ${widget.originalColor})');
      print('widget.focusColor is, ${widget.focusColor}');
    }

    Widget button = TextButton(
      style: TextButton.styleFrom(
        foregroundColor: color,
        padding: const EdgeInsets.fromLTRB(0, 16.0, 16.0, 16.0),
        textStyle: GTheme.subtitle1
            .copyWith(fontSize: 12, color: color, decoration: decoration),
      ),
      onPressed: () {
        setState(() {
          colorToggle();
        });
      },
      child: Text(text),
    );

    return button;
  }
}
