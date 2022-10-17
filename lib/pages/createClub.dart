import 'package:flutter/material.dart';
import 'package:growthclub/TestLibrary/components.dart';
import 'package:growthclub/components/after_auth_base.dart';
import 'package:growthclub/growthron_ui.dart';
import 'package:growthclub/typography.dart';

class NewClubPage extends StatefulWidget {
  const NewClubPage({Key? key}) : super(key: key);

  @override
  State<NewClubPage> createState() => _NewClubPageState();
}

class _NewClubPageState extends State<NewClubPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  late final TextEditingController whatWillYouCallX;
  late final TextEditingController mainPurpose;
  late final TextEditingController whatCategory;
  Modes? _character;

  @override
  void initState() {
    super.initState();
    whatWillYouCallX = TextEditingController();
    mainPurpose = TextEditingController();
    whatCategory = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32.0, 0, 32.0, 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Create a new club',
                        style: GTheme.subtitle1.copyWith(
                            fontSize: 26, fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(height: 20),
                buildTextFormField(
                  controller: whatWillYouCallX,
                  helperText: 'Keep it Short and easy to understand',
                  hintText: 'What will you call your club?',
                ),
                buildTextFormField(
                    controller: mainPurpose,
                    helperText: 'What will the club be about?',
                    hintText: 'What\'s the main purpose of the club?'),
                buildTextFormField(
                    controller: whatCategory,
                    helperText: 'Can\'t find one? Add one',
                    hintText: 'What category?',
                    suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp)),
                const SizedBox(height: 50),
                Text('Privacy',
                    style: GTheme.bodyText1.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    )),
                Column(
                  children: <Widget>[
                    RadioListTile<Modes>(
                      title: const Text('Private'),
                      value: Modes.private,
                      groupValue: _character,
                      onChanged: (Modes? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                    ulListItem('Only people you add can join'),
                    ulListItem('Your club will not be visible to others'),
                    RadioListTile<Modes>(
                      title: const Text('Public'),
                      value: Modes.public,
                      groupValue: _character,
                      onChanged: (Modes? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                    ulListItem('Only people you add can join'),
                    ulListItem('Your club will not be visible to others'),
                  ],
                ),
              ],
            ),
            GrowthronButton(
                text: 'Next',
                onPressed: () {},
                options: GrowthronButtonOptions(
                  width: 300,
                  height: 50,
                  color: GTheme.primaryButtonColor,
                  textStyle: GTheme.title3.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  elevation: 3,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ))
          ],
        ),
      ),
    );
  }

  Padding ulListItem(String text) {
    return Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(children: [
                  const Icon(Icons.circle, size: 1),
                  Text(text, style: smallStyle)
                ]),
              );
  }
}

TextStyle smallStyle =
    GTheme.bodyText1.copyWith(fontSize: 12, fontWeight: FontWeight.w100);

enum Modes { private, public }
