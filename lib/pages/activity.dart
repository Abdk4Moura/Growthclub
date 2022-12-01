import 'package:flutter/material.dart';
import 'package:growthclub/TestLibrary/components.dart';
import 'package:growthclub/assets_names.dart';
import 'package:growthclub/typography.dart';

import '../components/after_auth_base.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final List<Widget> cardList = [
      buildMessageCardWidget(
        user: 'Bukayo Smith',
        avatar: avatarDozie,
        goal: 'Goal: Read a book a week',
        comment:
            'Just completed my goal for today. I read chapter 5 of Stephen Covey’s “The 8th Habit.” 7 more to go!',
        imageLocation: booksImage,
      ),
      buildMessageCardWidget(
          user: 'Mubarak',
          avatar: avatarAlameen,
          goal: 'Goal: Complete Data Analytics Course',
          category: 'week-goals',
          comment:
              'My goals for the week:\n1. Complete Udemy course on Data Analytics.\n2. Compile data needed for the capstone project.\n3. Solve 3 practice questions '),
      buildMessageCardWidget(
          user: 'Dozie',
          goal: 'Become a Software Engineer',
          category: 'show-your-work',
          comment:
              'Hey guys! I built a tool that automatically converts your speech in Yoruba into English text')
    ];
    return BasePage(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).canvasColor,
      body: Column(mainAxisSize: MainAxisSize.max, children: [
        // heading
        Padding(
          padding: const EdgeInsets.fromLTRB(32.0, 10, 32.0, 5.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Activity',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              IconButton(
                color: GTheme.mainIconColor,
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              )
            ],
          ),
        ),
        Expanded(
            child: ListView(
          children: cardList,
        ))
      ]),
    );
  }

  MCWWrapper buildMessageCardWidget(
          {required String user,
          required String comment,
          String? avatar,
          String? imageLocation,
          String? goal,
          String? category}) =>
      MCWWrapper(MessageCardWidget(
        user: user,
        avatar: avatar,
        goal: goal,
        comment: comment,
        category: category,
        imageLocation: imageLocation,
      ));
}

class MCWWrapper extends StatelessWidget {
  const MCWWrapper(this.content, {Key? key}) : super(key: key);
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
          child: content,
        ),
      ],
    );
  }
}

class MessageCardWidget extends StatelessWidget {
  const MessageCardWidget({
    Key? key,
    required this.user,
    required this.comment,
    this.imageLocation,
    this.goal,
    this.avatar,
    this.category,
  }) : super(key: key);
  final String? avatar;
  final String user;
  final String? goal;
  final String comment;
  final String? category;
  final String? imageLocation;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [
      UserAndStatusWidget(
          user: user, avatar: avatar ?? testAppHeroImage, comment: goal ?? ''),
      TagsWidget(category: category ?? 'daily-report'),
      CommentWidget(comment),
    ];
    if (imageLocation != null) {
      widgets.add(ImageWidget(imageLocation!));
    }
    widgets.add(const ReactionsWidget());

    return Column(
      children: widgets,
    );
  }
}

class ReactionsWidget extends StatelessWidget {
  const ReactionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.comment)),
      IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.heart))
    ]);
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget(this.src, {Key? key}) : super(key: key);
  final String src;

  @override
  Widget build(BuildContext context) {
    return Image.asset(src, fit: BoxFit.cover, width: double.infinity);
  }
}

class CommentWidget extends StatelessWidget {
  const CommentWidget(this.text, {Key? key}) : super(key: key);
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: text != null
            ? const EdgeInsets.symmetric(vertical: 5)
            : EdgeInsets.zero,
        child: Text(text ?? '',
            style: GTheme.bodyText1.copyWith(
              fontSize: 11.36,
              fontWeight: FontWeight.w200,
            )));
  }
}

class TagsWidget extends StatelessWidget {
  const TagsWidget({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 6, 6, 6),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [buildCategoriesItem('#$category')]),
    );
  }

  CategoriesItem buildCategoriesItem(String text) => CategoriesItem(
        text,
        fontSize: 9.16,
        padding: const EdgeInsets.all(2),
      );
}

class UserAndStatusWidget extends StatelessWidget {
  const UserAndStatusWidget(
      {super.key,
      required this.user,
      required this.comment,
      required this.avatar});

  final String user;
  final String avatar;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 10, 2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(
              avatar,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(user,
              style: GTheme.bodyText1
                  .copyWith(fontSize: 12, fontWeight: FontWeight.w800)),
          Text(comment,
              style: GTheme.bodyText2.copyWith(
                fontSize: 10,
                color: const Color(0xFF393939),
              ))
        ])
      ],
    );
  }
}
