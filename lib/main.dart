import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:growthclub/TestRoutes/first_test.dart';
import 'package:growthclub/TestRoutes/inapp.dart';
import 'package:growthclub/TestRoutes/Routes/starter.dart';
import 'package:growthclub/TestRoutes/Routes/login_register.dart';
import 'package:growthclub/pages/loginIn.dart';

void main() {
  GoogleFonts.config.allowRuntimeFetching = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const LoginPage(),
        theme: firstTypgraphy());
  }

  ThemeData firstTypgraphy() {
    return themeData();
  }

  ThemeData themeData() {
    return ThemeData(
        backgroundColor: Colors.white,
        textTheme: GoogleFonts.montserratTextTheme().copyWith(
            labelSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            bodySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            titleSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            titleMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)));
  }
}

// StarterPage2(
//             bigText: 'Build connections that support your growth',
//             imagePath: 'assets/images/2.png')
