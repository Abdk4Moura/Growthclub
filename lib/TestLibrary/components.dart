import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:growthclub/growthron_ui.dart';
import 'package:growthclub/typography.dart';

class CategoriesItem extends StatelessWidget {
  CategoriesItem(
    this.text, {
    this.fontSize,
    this.borderRadius,
    this.padding,
    Key? key,
  }) : super(key: key) {
    index = _index++ % colorList.length;
  }

  final String text;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
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
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
            color: colorList[index],
            borderRadius: borderRadius ?? GBorderRadius),
        child: Center(
          child: Text(text,
              style: GTheme.bodyText2
                  .copyWith(fontWeight: FontWeight.w200, fontSize: fontSize)),
        ),
      ),
    );
  }
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

Widget buildGrowthronSectionListTile(
    {required String title, required int membersCount, required leadingImage}) {
  return ListTile(
    contentPadding: const EdgeInsets.all(0),
    title: Text(title, style: GTheme.bodyText3),
    subtitle: Text('$membersCount members',
        style: GTheme.bodyText2.copyWith(
          fontWeight: FontWeight.w100,
        )),
    trailing: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor:
                const MaterialStatePropertyAll(GTheme.primaryButtonColor),
            shadowColor:
                MaterialStatePropertyAll(Colors.black.withOpacity(.12))),
        child: Text(
          'join',
          style: GTheme.bodyText3.copyWith(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
        )),
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

class GrowthronSection extends StatelessWidget {
  const GrowthronSection(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    var _style = GTheme.title2;

    return Text(
      text,
      style: _style,
      textAlign: TextAlign.left,
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
    var _style = style ?? GTheme.title2;
    var iconGrey = Colors.grey;

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
                  shape:
                      CircleBorder(side: BorderSide(width: 2, color: iconGrey)),
                  child: IconButton(
                    color: iconGrey,
                    icon: const Icon(FontAwesomeIcons.plus),
                    onPressed: () {},
                  ))
              : Container(),
        )
      ],
    );
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
