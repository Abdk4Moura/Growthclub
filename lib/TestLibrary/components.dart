import 'package:auto_size_text/auto_size_text.dart';
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
      padding: const EdgeInsets.only(right: 4),
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

Divider buildDivider() {
  return const Divider(
    thickness: 0.5,
    height: 0.5,
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
        child: Text('join', style: GTheme.bodyText3.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white
        ),)),
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

Widget buildTextFormField(
    {TextEditingController? controller,
      String? helperText,
      String? hintText,
      Icon? suffixIcon}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      controller: controller,
      autofocus: true,
      obscureText: false,
      decoration: InputDecoration(
        helperText: helperText,
        helperStyle: helperText == null ? null : GTheme.smallSubtitle,
        contentPadding: const EdgeInsets.fromLTRB(15, 8, 0, 8),
        hintText: hintText,
        hintStyle: hintText == null ? null : GTheme.inputHintText,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: GTheme.primaryButtonColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: GTheme.primaryButtonColor,
            width: 1.7,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      style: GTheme.bodyText1,
      keyboardType: TextInputType.text,
    ),
  );
}

  SizedBox closeIconButton(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: GrowthronIconButton(
          borderRadius: 5,
          buttonSize: 15,
          color: GTheme.canvasColor,
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

 class _MainScreenCheckListTileState extends State<MainScreenCheckListTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      value: isChecked,
      onChanged: (bool? value) {
        widget.checkViewCallback(value!);
        setState(() {
          isChecked = value;
        });
      },
      title: AutoSizeText(widget.text,
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: widget.textStyle ??
              GTheme.bodyText3.copyWith(
                fontWeight: FontWeight.w100,
              )),
      dense: false,
      activeColor: widget.color ?? const Color(0xff50d055),
      //Color(0x7300561D),
      checkColor: widget.checkColor ?? GTheme.secondaryColor,
      tileColor: widget.tileColor ?? Colors.transparent,
      controlAffinity: ListTileControlAffinity.leading,
      checkboxShape: const CircleBorder(side: BorderSide(color: Colors.black)),
    );
  }
}

void _f(bool value) {
}

class MainScreenCheckListTile extends StatefulWidget {
  const MainScreenCheckListTile(
    this.text, {
    Key? key,
    this.textStyle,
        this.color,
        this.checkColor,
        this.tileColor,
        this.checkViewCallback = _f
  }) : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final Color? color;
  final Color? checkColor;
  final Color? tileColor;
  final void Function(bool) checkViewCallback;

  @override
  State<MainScreenCheckListTile> createState() =>
      _MainScreenCheckListTileState();
}