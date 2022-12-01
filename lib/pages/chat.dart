import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:growthclub/components/after_auth_base.dart';
import 'package:growthclub/typography.dart';

class ChatPage extends StatefulWidget {
  const ChatPage(
      {Key? key,
      required this.groupName,
      this.buttonStyle,
      required this.groupMembersCount})
      : super(key: key);
  final String groupName;
  final int groupMembersCount;
  final ButtonStyle? buttonStyle;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: Put a tangible thing in this
    return BasePage.withAppBar(
      appBar: AppBar(
        leading: IconButton(
          style: widget.buttonStyle,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Stack(
          children: [
            Text(widget.groupName),
            Row(
              children: [
                const Icon(Icons.people),
                Text('${widget.groupMembersCount} Members',
                    style: GTheme.bodyText1.copyWith(
                      fontSize: 9.33,
                      fontWeight: FontWeight.w400,
                    ))
              ],
            )
          ],
        ),
        scrolledUnderElevation: 4,
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.ellipsisVertical),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(),
    );
  }
}

class ChatPopUpMenu extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;

  const ChatPopUpMenu({Key? key, required this.menuList, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(itemBuilder: (context) => menuList);
  }
}
