import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:growthclub/components/after_auth_base.dart';
import 'package:growthclub/pages/test_canvas.dart';
import 'package:growthclub/typography.dart';

import '../assets_names.dart';
import '../growthron_ui.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({super.key});

  @override
  State<MainScreenPage> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> items = [
    'general',
    'week-goals',
    'show-your-work',
    'other-plans'
  ];

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 44, 16, 12),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      testAppHeroImage,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                child: Text('Hey, John', style: GTheme.title2),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              height: 45,
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
          const MainScreenTasksTrack(),
          const TestContainer(),
          GrowthronSubMenu(
              hasAddButtonBeside: true,
              headingText: 'Messages',
              list: listTiles.map<Widget>(buildListTile).toList()),
        ]),
      ),
    ));
  }

  ListTile buildListTile(list) {
    String title = list[0];
    String subtitle = list[1];
    String leadingImage = list[2];

    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(title, style: GTheme.bodyText3),
      subtitle: Text(subtitle, style: GTheme.bodyText1),
      leading: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Image.network(
          leadingImage,
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MainScreenTasksTrack extends StatefulWidget {
  const MainScreenTasksTrack({Key? key}) : super(key: key);

  @override
  State<MainScreenTasksTrack> createState() => _MainScreenTasksTrackState();
}

class _MainScreenTasksTrackState extends State<MainScreenTasksTrack> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const DisplayCheckListWidget(),
          SizedBox(height: 15),
          GrowthronButton(
            onPressed: () {},
            text: 'Report Progress',
            options: GrowthronButtonOptions(
              width: double.infinity,
              height: 44,
              color: const Color(0xFF83B1FA),
              textStyle: GTheme.bodyText2.apply(
                color: Colors.white,
              ),
              elevation: 3,
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          )
        ],
      ),
    );
  }
}

class TaskForTheWeek extends StatelessWidget {
  const TaskForTheWeek({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      controller: controller,
      children: const <Widget>[
        Center(
          child: Text('First Page'),
        ),
        Center(
          child: Text('Second Page'),
        ),
        Center(
          child: Text('Third Page'),
        ),
      ],
    );
  }
}

class DisplayCheckListWidget extends StatefulWidget {
  const DisplayCheckListWidget({Key? key}) : super(key: key);

  @override
  State<DisplayCheckListWidget> createState() => _DisplayCheckListWidgetState();
}

class _DisplayCheckListWidgetState extends State<DisplayCheckListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: GTheme.secondaryColor,
            borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.all(15),
        child: Column(children: const <MainScreenCheckListTile>[
          MainScreenCheckListTile('Complete Module 6 of Python'),
          MainScreenCheckListTile('Work on group project')
        ]));
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
    const Color(0xFF73D6DC),
    const Color(0xFF9ECCE8),
    const Color(0xcfffbeff),
    const Color(0xffffd877)
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration:
            BoxDecoration(color: colorList[index], borderRadius: GBorderRadius),
        child: Center(
          child: Text(text,
              style: GTheme.bodyText2.copyWith(fontWeight: FontWeight.w200)),
        ),
      ),
    );
  }
}

class GrowthronCustomButton extends StatelessWidget {
  const GrowthronCustomButton(
      {Key? key,
      required this.icon,
      required this.text,
      this.textStyle,
      this.options,
      required this.onPressed})
      : super(key: key);

  final IconData icon;
  final String text;
  final VoidVoidCallback onPressed;
  final IconOptions? options;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Center(
          child: Row(
            children: [
              Icon(
                icon,
                size: options?.size,
                color: options?.color,
                semanticLabel: options?.semanticLabel,
                textDirection: options?.textDirection,
                shadows: options?.shadows,
              ),
              Text(text, style: textStyle)
            ],
          ),
        ));
  }
}

class IconOptions {
  const IconOptions(
      {this.size,
      this.color,
      this.semanticLabel,
      this.textDirection,
      this.shadows});

  final double? size;
  final Color? color;
  final String? semanticLabel;
  final TextDirection? textDirection;
  final List<Shadow>? shadows;
}

class MainScreenCheckbox extends StatefulWidget {
  const MainScreenCheckbox({super.key});

  @override
  State<MainScreenCheckbox> createState() => _MainScreenCheckboxState();
}

class _MainScreenCheckboxState extends State<MainScreenCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return const Color(0x33D0AFFF);
    }

    return Checkbox(
      shape: const CircleBorder(),
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

class MainScreenCheckListTile extends StatefulWidget {
  const MainScreenCheckListTile(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  State<MainScreenCheckListTile> createState() =>
      _MainScreenCheckListTileState();
}

class _MainScreenCheckListTileState extends State<MainScreenCheckListTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
      title: AutoSizeText(widget.text,
          overflow: TextOverflow.clip, style: GTheme.bodyText2),
      activeColor: Colors.black,
      //Color(0x7300561D),
      checkColor: GTheme.secondaryColor,
      tileColor: Colors.transparent,
      controlAffinity: ListTileControlAffinity.leading,
      checkboxShape: const CircleBorder(side: BorderSide(color: Colors.black)),
    );
  }
}
