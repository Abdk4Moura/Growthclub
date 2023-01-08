import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:growthclub/TestLibrary/components.dart';
import 'package:growthclub/assets_names.dart';
import 'package:growthclub/components/after_auth_base.dart';
import 'package:growthclub/typography.dart';

class FindYourClubPage extends StatelessWidget {
  const FindYourClubPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(16, 8.0, 16, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('Now let\'s add the secret\ningredient',
                textAlign: TextAlign.center,
                style: GTheme.subtitle1
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 22)),
            Text('Find your club of superstars',
                style: GTheme.subtitle2.copyWith(fontWeight: FontWeight.w400)),
          ],
        ),
        const SizedBox(height: 70),
        Text('All(Public)',
            style: GTheme.title1.copyWith(
              fontWeight: FontWeight.w300,
              fontSize: 19.83,
            )),
        Expanded(
            child: ListView(
          children: [
            buildGrowthronSectionListTile(
                title: 'Learning a tech skill',
                membersCount: 200,
                leadingImage: jsAvatar),
            buildGrowthronSectionListTile(
                title: 'Taking a course',
                membersCount: 200,
                leadingImage: coursesImage),
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
        ))
      ]),
    ));
  }
}

var iconGrey = Colors.grey;
var _createWidget = Card(
    color: Colors.white,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: CircleBorder(side: BorderSide(width: 2, color: iconGrey)),
    child: IconButton(
      color: iconGrey,
      icon: const Icon(FontAwesomeIcons.plus),
      onPressed: () {},
    ));
