import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growthclub/pages/mainScreen.dart';
import 'package:growthclub/themes.dart';

import '../../auth/auth.dart';
import '../../growthron_ui.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
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
                      TitleWidget(big: 'Welcome!', small: 'Create an account'),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: InkWell(
                                onTap: () async {
                                  // await Navigator.push(
                                  //   context,
                                  //   PageTransition(
                                  //     type: PageTransitionType.fade,
                                  //     child: FlutterFlowExpandedImageView(
                                  //       image: Image.network(
                                  //         'https://picsum.photos/seed/948/600',
                                  //         fit: BoxFit.contain,
                                  //       ),
                                  //       allowRotation: false,
                                  //       tag: 'hero_tag_added',
                                  //       useHeroAnimation: true,
                                  //     ),
                                  //   ),
                                  // );
                                },
                                child: Hero(
                                  tag: 'hero_tag_added',
                                  transitionOnUserGestures: true,
                                  child: Container(
                                    width: 120,
                                    height: 120,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      'https://picsum.photos/seed/948/600',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: emailController,
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
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                              style: OutfitTheme.bodyText1,
                              keyboardType: TextInputType.name,
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: passwordController,
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 30, 0, 0),
                              child: GrowthronButton(
                                onPressed: () async {
                                  final email = emailController.text;
                                  final password = passwordController.text;

                                  // createUser(emailAddress: email, password: password);

                                  await Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const MainScreenPage(),
                                    ),
                                    (r) => false,
                                  );
                                },
                                text: 'Login\n',
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
                            )
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
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(children: [
                      const Spacer(),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () async {
                                final user = await signInWithGoogle();
                                if (user == null) {
                                  // user == null
                                  return;
                                }

                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const MainScreenPage(),
                                  ),
                                  (r) => false,
                                );
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  boxShadow: [
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
                                    builder: (context) =>
                                        const MainScreenPage(),
                                  ),
                                  (r) => false,
                                );
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  boxShadow: [
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
                                    builder: (context) =>
                                        const MainScreenPage(),
                                  ),
                                  (r) => false,
                                );
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  boxShadow: [
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
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                boxShadow: [
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
                      )
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

//   Future createUser({required String emailAddress, required String password}) async {
//     // Reference to document
//     // final doc = FirebaseFirestore.instance.collection('users').doc('my-id');
//
//     final json = {
//       'email': emailAddress,
//       'password': password,
//       'birthday': DateTime(2001, 7, 28),
//     };
//
//     // await doc.set(json);
//   }
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
