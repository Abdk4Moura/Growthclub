import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growthclub/auth/auth.dart';
import 'package:growthclub/firebase_options.dart';
import 'package:growthclub/pages/onboarding.dart';
import 'package:growthclub/screens/chat_home_screen.dart';
import 'package:provider/provider.dart';

import 'TestLibrary/ui_view_experiments.dart' show TabBarDemo;
import 'models/club.dart';

// global VARS

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAuth.instance.useAuthEmulator('127.0.0.1', 9099);

  GoogleFonts.config.allowRuntimeFetching = true;
  runApp(ChangeNotifierProvider<AuthModel>(
      create: (_) => AuthModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  SplashScreen(), //  const Chats()
        theme: ThemeData(
                useMaterial3: true,
                dividerColor: const Color(0xFFBEBEBE),
                iconTheme: const IconThemeData(
                  color: Colors.grey,
                ),
                backgroundColor: const Color(0xffffffff),
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
