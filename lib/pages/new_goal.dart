import 'package:flutter/material.dart';
import 'package:growthclub/growthron_ui.dart';
import 'package:growthclub/typography.dart';

class NewGoalPage extends StatefulWidget {
  const NewGoalPage({Key? key}) : super(key: key);

  @override
  _NewGoalPageState createState() => _NewGoalPageState();
}

class _NewGoalPageState extends State<NewGoalPage> {
  String? teamSelectValue;
  TextEditingController? shortBioController;
  TextEditingController? userNameController;
  TextEditingController whatsYourGoalController = TextEditingController();
  String? userSelectValue1;
  String? userSelectValue2;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    shortBioController = TextEditingController();
    userNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      Text('New Goal',
                          style: GTheme.subtitle1.copyWith(
                            fontSize: 24,
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: closeIconButton(context),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('This can be the beginning of something great',
                          style: GTheme.bodyText2),
                    ],
                  ),
                  const SizedBox(height: 20),
                  buildTextFormField(
                      controller: whatsYourGoalController,
                      helperText: 'KISS - Keep it Short and Specific\n',
                      hintText: 'What\'s your goal\n',
                      suffixIcon: const Icon(Icons.add)),
                  const SizedBox(height: 50),
                  Text('Examples',
                      style: GTheme.bodyText1.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      )),
                  Text('Complete Web development course', style: smallStyle),
                  Text('Study for GRE Exams', style: smallStyle),
                  Text('Commit to an exercise routine', style: smallStyle),
                  const SizedBox(height: 50),
                  TextButton(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        alignment: Alignment.centerLeft),
                    onPressed: () {},
                    child: Text('Need help choosing a goal? Let\'s talk!',
                        style: GTheme.subtitle1.copyWith(
                            fontWeight: FontWeight.w200,
                            fontSize: 12,
                            color: GTheme.primaryButtonColor,
                            decoration: TextDecoration.underline)),
                  ),
                ],
              ),
              Column(
                children: [
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
                      )),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {},
                    child: Text('Skip',
                        style: GTheme.subtitle1.copyWith(
                            fontWeight: FontWeight.w200,
                            fontSize: 12,
                            color: GTheme.primaryButtonColor,
                            decoration: TextDecoration.underline)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  TextStyle smallStyle =
      GTheme.bodyText1.copyWith(fontSize: 12, fontWeight: FontWeight.w100);

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
