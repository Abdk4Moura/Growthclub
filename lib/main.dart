import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:growthclub/TestRoutes/first_test.dart';
import 'package:growthclub/TestRoutes/inapp.dart';
import 'package:growthclub/TestRoutes/Routes/starter.dart';
import 'package:growthclub/TestRoutes/Routes/login_register.dart';
import 'package:growthclub/pages/test_canvas.dart';

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
        home: TestCanvas(), // HomePageWidget()
        theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()).copyWith(
            textTheme: TextTheme(
                labelMedium: TextStyle(fontSize: 20),
                labelLarge: TextStyle(fontSize: 20),
                labelSmall: TextStyle(fontSize: 14),
                bodySmall: TextStyle(fontSize: 14),
                bodyMedium: TextStyle(fontSize: 16),
                bodyLarge: TextStyle(fontSize: 18),
                titleSmall: TextStyle(fontSize: 20),
                titleMedium: TextStyle(fontSize: 22),
                titleLarge: TextStyle(fontSize: 24)),
            cardColor: Color(0xA44F4FFF)));
  }
}

class Journalist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Row(children: const <Widget>[
          Center(child: Text('What is this')),
          Icon(Icons.abc_outlined)
        ]));
  }
}

class JournalEdit extends StatefulWidget {
  @override
  _JournalEditState createState() => _JournalEditState();
}

class _JournalEditState extends State<JournalEdit> {
  String note = 'Trip A';
  void _onPressed() {
    setState(() {
      note = 'Trip A' == note ? 'Trip B' : 'Trip A';
    });
  }

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Column(
      children: <Widget>[
        const Icon(Icons.abc_sharp),
        Text('$note'),
        ElevatedButton(
          onPressed: _onPressed,
          child: const Text('This Button!'),
        ),
      ],
    );
  }
}

Column themeColumnWidget = Column(
  children: <Widget>[
    Theme(
// Unique theme with ThemeData - Overwrite
      data: ThemeData(
        cardColor: Colors.deepOrange,
      ),
      child: const Card(
        child: Text('Unique ThemeData'),
      ),
    ),
    Theme(
// copyWith Theme - Inherit (Extended)
      data: Theme.of(_context!).copyWith(cardColor: Colors.deepOrange),
      child: const Card(
        child: Text('copyWith Theme'),
      ),
    ),
  ],
);

// StarterPage2(
//             bigText: 'Build connections that support your growth',
//             imagePath: 'assets/images/2.png')
