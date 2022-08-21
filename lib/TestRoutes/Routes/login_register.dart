import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growthclub/pages/mainScreen.dart';
import 'package:growthclub/themes.dart';

import '../../auth/auth.dart';
import '../../growthron_ui.dart';

class RegisterPageWidget extends StatefulWidget {
  const RegisterPageWidget({Key? key}) : super(key: key);

  @override
  _RegisterPageWidgetState createState() => _RegisterPageWidgetState();
}

class _RegisterPageWidgetState extends State<RegisterPageWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      body: DefaultTextStyle(
        style: HeadingTextStyle,
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      TitleWidget(
                          big: 'Let\'s get you set up.',
                          small: 'Create an account'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 400,
                      decoration: const BoxDecoration(),
                      child: Form(
                        key: formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextFormField(
                              controller: textController1,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Full Name',
                                hintText: 'Tony Stark',
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
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                              style: OutfitTheme.bodyText1,
                              keyboardType: TextInputType.name,
                            ),
                            TextFormField(
                              controller: textController2,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: 'tonystark@example.com',
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
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                              style: OutfitTheme.bodyText1,
                              keyboardType: TextInputType.name,
                            ),
                            TextFormField(
                              controller: textController3,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'Hard to guess, easy to remember\n',
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
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                              style: OutfitTheme.bodyText1,
                              keyboardType: TextInputType.visiblePassword,
                            ),
                            TextFormField(
                              controller: textController4,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                hintText: 'Type it again',
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
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                              style: OutfitTheme.bodyText1,
                              keyboardType: TextInputType.visiblePassword,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Or continue using',
                    style: OutfitTheme.title1,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () async {
                            final user = await signInWithGoogle();
                            if (user == null) {
                              return;
                            }
                            await Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainScreenPage(),
                              ),
                              (r) => false,
                            );
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color(0x3314181B),
                                  offset: Offset(0, 2),
                                )
                              ],
                              shape: BoxShape.circle,
                            ),
                            alignment: const AlignmentDirectional(0, 0),
                            child: FaIcon(
                              FontAwesomeIcons.google,
                              color: Theme.of(context).canvasColor,
                              size: 24,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            final user = await signInWithApple();
                            if (user == null) {
                              return;
                            }
                            await Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainScreenPage(),
                              ),
                              (r) => false,
                            );
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color(0x3314181B),
                                  offset: Offset(0, 2),
                                )
                              ],
                              shape: BoxShape.circle,
                            ),
                            alignment: const AlignmentDirectional(0, 0),
                            child: FaIcon(
                              FontAwesomeIcons.apple,
                              color: Theme.of(context).canvasColor,
                              size: 24,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            final user = await signInWithFacebook();
                            if (user == null) {
                              return;
                            }
                            await Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainScreenPage(),
                              ),
                              (r) => false,
                            );
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color(0x3314181B),
                                  offset: Offset(0, 2),
                                )
                              ],
                              shape: BoxShape.circle,
                            ),
                            alignment: const AlignmentDirectional(0, 0),
                            child: FaIcon(
                              FontAwesomeIcons.facebookF,
                              color: Theme.of(context).canvasColor,
                              size: 24,
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 5,
                                color: Color(0x3314181B),
                                offset: Offset(0, 2),
                              )
                            ],
                            shape: BoxShape.circle,
                          ),
                          alignment: const AlignmentDirectional(0, 0),
                          child: Icon(
                            Icons.phone_sharp,
                            color: Theme.of(context).canvasColor,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: GrowthronButton(
                      onPressed: () async {
                        print('ButtonPrimary pressed ...');

                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainScreenPage(),
                          ),
                          (r) => false,
                        );
                      },
                      text: 'Get Started\n',
                      options: GrowthronButtonOptions(
                        width: 300,
                        height: 50,
                        color: Colors.black,
                        textStyle: OutfitTheme.subtitle1.apply(
                          color: Colors.white,
                        ),
                        elevation: 3,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

TextFormField GrowthronFormField(BuildContext context,
    {String? labelText,
    String? hintText,
    Widget? suffixIcon,
    TextEditingController? controller,
    TextInputType? textInputType,
    bool isPasswordField = true}) {
  bool passwordVisibility = true;

  if (isPasswordField) {
    passwordVisibility = false;
    textInputType = TextInputType.visiblePassword;
    Widget icon = const Icon(FontAwesomeIcons.eye);
    void onPressed() {
      if (passwordVisibility) {
        icon = const Icon(FontAwesomeIcons.eyeSlash);
      } else {
        icon = const Icon(FontAwesomeIcons.eye);
      }
    }

    suffixIcon = IconButton(onPressed: onPressed, icon: icon);
  }

  return TextFormField(
    controller: controller,
    obscureText: !passwordVisibility,
    autofocus: true,
    decoration: InputDecoration(
      suffixIcon: suffixIcon,
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
          width: 1,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
    ),
    style: OutfitTheme.bodyText1,
    keyboardType: textInputType,
  );
}

Widget TitleWidget({String? big, String? small}) {
  return Container(
    child: Column(
      children: [
        Container(width: 250, child: CenterText(big as String)),
        CenterText(small as String, style: SmallTextStyle)
      ],
    ),
  );
}

TextStyle HeadingTextStyle =
    GoogleFonts.montserrat(fontSize: 30, fontWeight: FontWeight.w700);

TextStyle SmallTextStyle =
    GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w400);

Widget CenterText(String data, {TextStyle? style}) {
  return Text(
    data,
    style: style,
    textAlign: TextAlign.center,
  );
}
