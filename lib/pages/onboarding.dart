import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growthclub/TestRoutes/inapp.dart' show AppPage1;
import 'package:growthclub/auth/auth.dart';
import 'package:growthclub/pages/login.dart';
import 'package:growthclub/pages/mainScreen.dart';
import 'package:growthclub/themes.dart';
import 'package:growthclub/typography.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const ContextProvider()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
                image: AssetImage("assets/images/growthron_white_logo_gr.png"))
          ],
        ),
      ),
    );
  }
}

class ContextProvider extends StatelessWidget {
  const ContextProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthModel>(builder: (context, authModel, _) {
      final currentUser = authModel.instance.currentUser;
      if (kDebugMode) {
        print('currentUser: $currentUser');
      }
      if (currentUser == null) {
        return const LoginPage();
      }
      if (currentUser.displayName == '') {
        return const InfoPage();
      }
      return const MainScreenPage();
    });
  }
}

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late final nameController;

  late final emailController;

  late final phoneNumberController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthModel>(
      builder: (context, authModel, _) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('Additional Info',
                          textAlign: TextAlign.center,
                          style: GTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.w700, fontSize: 22)),
                      Text('Please add additional info like your name',
                          style: GTheme.subtitle2
                              .copyWith(fontWeight: FontWeight.w400)),
                    ],
                  ),
                  const SizedBox(height: 70),
                  TextFormField(
                    controller: nameController,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'John Doe',
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
                  TextFormField(
                    controller: phoneNumberController,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      hintText: '08100023340',
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StarterPage1 extends StatelessWidget {
  final VoidCallback? callback;

  StarterPage1(this.callback, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/1.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        DefaultTextStyle(
          style: HeadingTextStyle,
          child: Container(
              alignment: Alignment.center,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 40),
                  Column(
                    children: [
                      const SizedBox(
                        width: 300,
                        child: Text('Welcome to Growth Clubs',
                            textAlign: TextAlign.center),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text('Because you are, I am',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w300,
                                fontSize: 20,
                              ))),
                    ],
                  ),
                  const SizedBox(height: 300),
                  Container(
                    padding: const EdgeInsets.all(25),
                    child: Image.asset(
                      "assets/images/page_vector.png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  GetStartedButton(callBack: callback)
                ],
              )),
        )
      ],
    );
  }
}

class StarterPage2 extends StatelessWidget {
  final String imagePath;
  final String bigText;
  final VoidCallback? callback;

  const StarterPage2(this.callback, {
    super.key,
    required this.imagePath,
    required this.bigText,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          imagePath,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        DefaultTextStyle(
          style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 39,
              shadows: [
                const Shadow(
                  blurRadius: 5.0,
                  color: Color.fromARGB(255, 24, 24, 24),
                  offset: Offset(0.0, 5.0),
                ),
              ],
              fontWeight: FontWeight.w700),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 400,
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Text(bigText, textAlign: TextAlign.center),
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 55, vertical: 20)
                                .copyWith(bottom: 0),
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(children: <TextSpan>[
                                  TextSpan(
                                      text:
                                      'Make progress on your goals with a ',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                  TextSpan(
                                      text: 'dedicated community',
                                      style: TextStyle(
                                          color:
                                          Color.fromARGB(255, 0, 125, 178),
                                          fontSize: 20))
                                ]))),
                      ],
                    ),
                    GetStartedButton(callBack: callback),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

SizedBox GetStartedButton({VoidCallback? callBack}) {
  return SizedBox(
      width: 350,
      height: 75,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 43, 158, 207)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
        onPressed: callBack,
        child: Text('Get started',
            style:
            GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w300)),
      ));
}

void onPressed() {}

var keyValue = [
  ['Build connections that support your growth', 'assets/images/2.png'],
  ['Review your goals and share progress & obstacles', 'assets/images/3.png'],
  ['Review your goals and share progress & obstacles', 'assets/images/4.png']
];

TextStyle HeadingTextStyle = GoogleFonts.montserrat(
    color: Colors.white,
    fontSize: 39,
    shadows: [
      const Shadow(
        blurRadius: 5.0,
        color: Color.fromARGB(255, 90, 90, 90),
        offset: Offset(0.0, 5.0),
      ),
    ],
    fontWeight: FontWeight.w700);

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
  int index = 0;

  int rotate(int index) {
    print(index);
    if (index - 2 < keyValue.length) {
      return ++this.index;
    }
    index = 0;

    return index;
  }

  void onPressed() async {
    if (index == 2) {
      final prefs = await SharedPreferences.getInstance();

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const AppPage1(),
      ));

      return;
    }
    controller.animateToPage(rotate(index),
        duration: const Duration(seconds: 1), curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(keyValue);

    var pageL = [
      StarterPage1(onPressed),
      ...keyValue
          .map((element) => StarterPage2(
        onPressed,
        bigText: element[0],
        imagePath: element[1],
      ))
          .toList()
    ];

    return Scaffold(
      body: PageView(
        controller: controller,
        children: pageL,
      ),
    );
  }
}
