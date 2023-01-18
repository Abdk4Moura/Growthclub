import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:growthclub/growthron_ui.dart';
import 'package:growthclub/pages/activity.dart';
import 'package:growthclub/pages/createClub.dart';
import 'package:growthclub/pages/createGoal.dart';
import 'package:growthclub/pages/mainScreen.dart';
import 'package:growthclub/screens/settings.dart';
import 'package:growthclub/themes.dart';
import 'package:growthclub/typography.dart';

class GrowthronTextField extends StatelessWidget {
  const GrowthronTextField({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.fillColor,
    this.suffixIcon,
    this.suffixIconColor,
    this.suffix,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final Icon? suffixIcon;
  final Color? suffixIconColor;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: true,
      obscureText: false,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor,
        suffix: suffix,
        fillColor: fillColor,
        labelText: labelText,
        hintText: hintText,
        hintStyle: OutfitTheme.bodyText2,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      style: OutfitTheme.bodyText1,
      keyboardType: keyboardType,
    );
  }
}

class DialogTemplate extends StatelessWidget {
  const DialogTemplate(
      {Key? key,
      this.heading,
      this.headingColor,
      this.button,
      this.dialogContent,
      this.buttonColor,
      this.otherButton,
      this.buttonOnPressed,
      this.otherButtonOnPressed,
      this.altButtonText,
      this.altOtherButtonText,
      this.prompt})
      : assert(!(altButtonText != null && button != null),
            'if button text is provided, button should not be used'),
        assert(
            otherButton != null && button != null ||
                button != null && otherButton == null ||
                button == null && otherButton == null,
            'Both major button and minor button can be null,'
            'but when minor button is a none-null, major button must also be a non-null'),
        assert(
            (button != null || altButtonText != null) &&
                    buttonOnPressed != null ||
                (button == null || altButtonText == null) &&
                    buttonOnPressed == null,
            'When a button exists, its onPressed property is also compulsory'),
        assert(
            (otherButton == null || altOtherButtonText == null) &&
                    otherButtonOnPressed == null ||
                (otherButton != null || altOtherButtonText != null) &&
                    otherButtonOnPressed != null,
            'When a button exists, its onPressed property is also compulsory'),
        assert(
            (button == null || altButtonText == null) ||
                !((button != null || altButtonText != null) && heading == null),
            'If button exists, heading cannot be null'),
        assert(!(headingColor != null && heading == null)),
        assert(
            (button == null || altButtonText == null) &&
                    dialogContent != null ||
                (button != null || altButtonText != null) &&
                    dialogContent == null,
            'Only either of `button` and `dialogContent` can exist'),
        super(key: key);

  final String? heading;
  final Color? headingColor;
  final Widget? button;
  final String? altButtonText;
  final String? altOtherButtonText;
  final Widget? otherButton;
  final Color? buttonColor;
  final VoidVoidCallback? buttonOnPressed;
  final VoidVoidCallback? otherButtonOnPressed;
  final List<Widget>? dialogContent;
  final String? prompt;

  @override
  Widget build(BuildContext context) {
    List<Widget> content = [];
    late Widget button1;
    late Widget button2;

    if (heading != null) {
      content.add(Text(heading!,
          textAlign: TextAlign.center,
          style: GTheme.subtitle1.copyWith(
            color: headingColor ?? Colors.red,
            fontSize: 22,
          )));
    }

    if (prompt != null) {
      content.add(Text(
        prompt!,
        textAlign: TextAlign.center,
        style: bodyText.copyWith(color: Colors.black),
      ));
    }

    if (button != null || altButtonText != null) {
      content.add(
        const SizedBox(
          height: 30,
        ),
      );
      if (altButtonText != null) {
        button1 = GrowthronButton(
            onPressed: buttonOnPressed!,
            text: altButtonText!,
            options: GrowthronButtonOptions(
                color: buttonColor ?? Colors.red,
                textStyle: bodyText,
                borderRadius: BorderRadius.circular(25),
                borderSide:
                    BorderSide(color: buttonColor ?? Colors.red, width: 1)));
      } else {
        button1 = button!;
      }

      if (otherButton == null && altOtherButtonText == null) {
        content.add(button1);
      } else {
        if (altOtherButtonText != null) {
          button2 = GrowthronButton(
              onPressed: otherButtonOnPressed!,
              text: altOtherButtonText!,
              options: GrowthronButtonOptions(
                  width: 130,
                  color: Colors.white,
                  textStyle: bodyText.copyWith(color: Colors.black),
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: buttonColor ?? Colors.red)));
        } else {
          button2 = otherButton!;
        }

        content.add(Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[button1, const SizedBox(width: 25), button2]));
      }
    }

    return Dialog(
      insetAnimationCurve: Curves.bounceOut,
      insetAnimationDuration: const Duration(milliseconds: 500),
      insetPadding: const EdgeInsets.all(0),
      elevation: 1,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(17))),
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.30,
        child: Padding(
            padding: EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(Icons.close_sharp),
                          onPressed: () => Navigator.pop(context),
                        )),
                    Container(
                      alignment: Alignment.center,
                      decoration:
                      const BoxDecoration(shape: BoxShape.rectangle),
                      width: 300,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (final widget in content) widget,
                          if (dialogContent != null)
                            for (final widget in dialogContent!) widget,
                        ],
                      ),
                    ),
                  ],
                ),
                bottomNavBar(context)
              ],
            )),
      ),
    );
  }
}

Widget bottomNavBar(BuildContext context) => Container(
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(
        width: 1,
      ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // showDialog<String>(
              //   context: context,
              //   builder: (BuildContext context) => dialogTemplate(),
              // );
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()));
            },
            color: Colors.black.withOpacity(0.8),
          ),
          IconButton(
            icon: const Icon(FontAwesomeIcons.peopleGroup),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const NewClubPage()));
            },
            color: Colors.black.withOpacity(0.8),
          ),
          IconButton(
              icon: const Icon(Icons.other_houses_outlined),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ActivityPage()));
              },
              color: Colors.black.withOpacity(0.8)),
          IconButton(
              icon: const Icon(FontAwesomeIcons.bullseye),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewGoalPage()));
              },
              color: Colors.black.withOpacity(0.8)),
          IconButton(
              icon: const Icon(Icons.person_outline),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainScreenPage()));
              },
              color: Colors.black.withOpacity(0.8)),
        ],
      ),
    );

DialogTemplate leaveTheClub(BuildContext context) {
  return DialogTemplate(
    heading: 'Leave the club',
    prompt: 'Are you sure you want to be removed from\nthe club?',
    altButtonText: 'Leave & report',
    altOtherButtonText: 'Leave',
    buttonOnPressed: () {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              haveBeenRemoved(controller: TextEditingController()));
    },
    otherButtonOnPressed: () {},
  );
}

DialogTemplate haveBeenRemoved({TextEditingController? controller}) {
  return DialogTemplate(
    heading: 'You have been removed!',
    headingColor: Colors.black,
    dialogContent: <Widget>[
      Text(
        'Tell us why you left.',
        style: bodyText.copyWith(color: Colors.black54),
      ),
      GrowthronTextField(
        hintText: 'Type here...',
        controller: controller,
        fillColor: const Color(0xFFEAEAEA),
      ),
      TextButton(
        style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(GTheme.subtitle1.copyWith(
                fontWeight: FontWeight.w200,
                fontSize: 12,
                color: GTheme.primaryButtonColor,
                decoration: TextDecoration.underline))),
        onPressed: () {
          final text = controller!.text;
          // TODO: add a complaint --
        },
        child: const Text(
          'Submit',
        ),
      )
    ],
  );
}

DialogTemplate reportClub({TextEditingController? controller}) {
  return DialogTemplate(
    heading: 'Report club',
    headingColor: Colors.black,
    dialogContent: <Widget>[
      GrowthronTextField(
        hintText: 'Type here...',
        controller: controller,
        fillColor: const Color(0xFFEAEAEA),
        suffix: IconButton(
            icon: const Icon(Icons.keyboard_arrow_down_sharp,
                color: Colors.black),
            onPressed: () {}),
      ),
      TextButton(
        style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(GTheme.subtitle1.copyWith(
                fontWeight: FontWeight.w200,
                fontSize: 12,
                color: GTheme.primaryButtonColor,
                decoration: TextDecoration.underline))),
        onPressed: () {},
        child: const Text(
          'Submit',
        ),
      )
    ],
  );
}

DialogTemplate done({TextEditingController? controller}) {
  return DialogTemplate(
    heading: 'Done✅',
    headingColor: Colors.black,
    dialogContent: <Widget>[
      Text('Thanks for the feedback',
          textAlign: TextAlign.center,
          style: bodyText.copyWith(
            fontWeight: FontWeight.w100,
          ))
    ],
  );
}

final bodyText =
    GTheme.bodyText2.copyWith(fontSize: 12.58, color: Colors.white);
