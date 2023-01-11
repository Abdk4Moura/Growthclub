import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growthclub/firebase_options.dart';
import 'package:growthclub/pages/onboarding.dart';

// global VARS

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  GoogleFonts.config.allowRuntimeFetching = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(), //  HomePageWidget()
        theme: ThemeData(
            useMaterial3: true,
                dividerColor: const Color(0xFFBEBEBE),
                iconTheme: const IconThemeData(
                  color: Colors.grey,
                ),
                textTheme: const TextTheme(
                        labelMedium: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                        labelLarge: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                        labelSmall: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                bodySmall: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w700),
                bodyMedium: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w700),
                bodyLarge: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w700),
                titleSmall: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w700),
                titleMedium: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.w700),
                titleLarge: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.w700))
                .apply(fontFamily: 'Montserrat'))
            .copyWith(cardColor: const Color(0xA44F4FFF)));
  }
}
