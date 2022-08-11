import 'package:flutter/material.dart';

// global VARS

BuildContext? _context;

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
