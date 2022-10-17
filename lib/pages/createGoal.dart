import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growthclub/growthron_ui.dart';
import 'package:growthclub/typography.dart';

class CreateGoal extends StatefulWidget {
  const CreateGoal({Key? key}) : super(key: key);

  @override
  _CreateGoalState createState() => _CreateGoalState();
}

class _CreateGoalState extends State<CreateGoal> {
  String? teamSelectValue;
  TextEditingController? whatsYourGoalController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    whatsYourGoalController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text('New Goal',
                    style: GTheme.subtitle1.copyWith(
                      fontSize: 24,
                    )),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                child: closeIconButton(context),
              ),
            ],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ready to take on a new quest?',
                        style: GTheme.bodyText2),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    buildTextFormField(
                        controller: whatsYourGoalController,
                        helperText: 'KISS - Keep it Short and Specific\n',
                        hintText: 'What\'s your goal\n',
                        suffixIcon: const Icon(Icons.add)),
                    buildTextFormField(
                        helperText: 'Can\'t find one? Add one',
                        hintText: 'What Category?'),
                    const SizedBox(height: 20),
                    Text(
                      'Time',
                      style: GTheme.bodyText2
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    const Divider(),
                    buildTextFormField(
                      hintText: 'When do you want to achieve this?',
                      helperText: 'You can change later if gf',
                      suffixIcon: const Icon(Icons.add),
                    ),
                    buildTextFormField(
                        hintText: 'Starting date',
                        helperText: 'When will you begin?',
                        suffixIcon: const Icon(Icons.add)),
                    buildTextFormField(
                        hintText: 'How often will you work on it?',
                        helperText: 'Don\'t know? We\'ll help you',
                        suffixIcon:
                            const Icon(Icons.keyboard_arrow_down_rounded)),
                    const SizedBox(height: 20),
                    Text(
                      'Tracking',
                      style: GTheme.bodyText2
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    buildTextFormField(
                        hintText: 'How will you measure your progress?',
                        helperText: 'Can\'t find one? Add one',
                        suffixIcon:
                            const Icon(Icons.keyboard_arrow_down_rounded))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
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
}
