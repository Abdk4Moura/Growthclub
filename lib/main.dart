import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growthclub/pages/mainScreen.dart';

// global VARS

BuildContext? _context;

void main() {
  GoogleFonts.config.allowRuntimeFetching = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MainScreenPage(), // HomePageWidget()
        theme: ThemeData(
                textTheme: GoogleFonts.montserratTextTheme(const TextTheme(
                    labelMedium: TextStyle(fontSize: 20),
                    labelLarge: TextStyle(fontSize: 20),
                    labelSmall: TextStyle(fontSize: 14),
                    bodySmall: TextStyle(fontSize: 14),
                    bodyMedium: TextStyle(fontSize: 16),
                    bodyLarge: TextStyle(fontSize: 18),
                    titleSmall: TextStyle(fontSize: 20),
                    titleMedium: TextStyle(fontSize: 22),
                    titleLarge: TextStyle(fontSize: 24))))
            .copyWith(cardColor: const Color(0xA44F4FFF)));
  }
}
