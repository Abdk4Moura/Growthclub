import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:growthclub/TestRoutes/first_test.dart';
import 'package:growthclub/TestRoutes/inapp.dart';
import 'package:growthclub/TestRoutes/Routes/starter.dart';
import 'package:growthclub/TestRoutes/Routes/login_register.dart';

void main() {
  GoogleFonts.config.allowRuntimeFetching = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePageWidget(),
        theme: firstTypgraphy());
  }

  ThemeData firstTypgraphy() =>
      ThemeData(textTheme: GoogleFonts.montserratTextTheme()).copyWith(
          textTheme: TextTheme(
              labelSmall: TextStyle(fontSize: 14),
              bodySmall: TextStyle(fontSize: 14),
              bodyMedium: TextStyle(fontSize: 16),
              bodyLarge: TextStyle(fontSize: 18),
              titleSmall: TextStyle(fontSize: 20),
              titleMedium: TextStyle(fontSize: 22),
              titleLarge: TextStyle(fontSize: 24)));
}



// StarterPage2(
//             bigText: 'Build connections that support your growth',
//             imagePath: 'assets/images/2.png')