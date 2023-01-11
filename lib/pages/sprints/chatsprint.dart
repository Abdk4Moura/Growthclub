import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:growthclub/TestLibrary/components.dart';
import 'package:growthclub/assets_names.dart';
import 'package:growthclub/components/after_auth_base.dart';
import 'package:growthclub/typography.dart';

class ChatAndClubs extends StatelessWidget {
  const ChatAndClubs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Chats',
            textAlign: TextAlign.center,
            style: GTheme.subtitle1
                .copyWith(fontWeight: FontWeight.w700, fontSize: 22)),
        const SizedBox(height: 70),
        Column(
          children: [
            buildGrowthronSectionListTile(
                title: 'Learning a tech skill',
                membersCount: 200,
                leadingImage: jsAvatar,
                isNew: false),
            buildGrowthronSectionListTile(
                title: 'Taking a course',
                membersCount: 200,
                leadingImage: coursesImage,
                isNew: true),
            buildGrowthronSectionListTile(
                title: 'A book a month',
                membersCount: 200,
                leadingImage: booksImage),
            buildGrowthronSectionListTile(
                title: 'Get a job', membersCount: 200, leadingImage: jobsImage)
          ].followedBy([
            _createWidget,
            TextButton(
              onPressed: () {},
              child: Text('Create yours',
                  style: GTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.w200,
                      fontSize: 12,
                      color: GTheme.primaryButtonColor,
                      decoration: TextDecoration.underline)),
            )
          ]).toList(),
        )
      ]),
    ));
  }
}

var _iconGrey = Colors.grey;
var _createWidget = Card(
    color: Colors.white,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: CircleBorder(side: BorderSide(width: 2, color: _iconGrey)),
    child: IconButton(
      color: _iconGrey,
      icon: const Icon(FontAwesomeIcons.plus),
      onPressed: () {},
    ));
