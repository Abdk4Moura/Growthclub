import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growthclub/TestRoutes/starterpage.dart';

List<String> useList = <String>['a', 'and', 'b'];
var useL = useList.map((element) => ElevatedButton(
      onPressed: () {},
      child: Text(element),
      // style: ButtonStyle(
      //   padding: ,
      //   backgroundColor: MaterialStateColor.resolveWith((states) => ),
      // ),
    ));

Color _color = Colors.orange;

Widget _stat = OrangeContainer();

// Widget _state = Center(
//   child: Container(
//     color: _color,
//     width: 200,
//     height: 200,
//   ),
// );

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  SGState createState() => SGState();
}

class SGState extends State<AppPage> {
  void _changeView() {
    setState(() {
      _stat = InputDecoratorsWidget();
    });
  }

  void _changeToBlue() {
    setState(() {
      _color = Colors.lightBlue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _state(),
      bottomNavigationBar: BottomAppBar(child: ButtonBarWidget(_changeView)),
    );
  }
}

class _state extends StatelessWidget {
  const _state({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white38,
      child: Center(
        child: Container(width: 500, height: 500, child: _stat),
      ),
    );
  }
}

class ButtonBarWidget extends StatelessWidget {
  final VoidCallback? action;

  const ButtonBarWidget(this.action, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: Row(
        children: [
          ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.map),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.airport_shuttle),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.brush),
                  highlightColor: Colors.purple,
                  onPressed: () {},
                )
              ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ...useL,
              IconButton(
                  onPressed: action, icon: const Icon(Icons.pan_tool_sharp))
            ],
          )
        ],
      ),
    );
  }
}

class OrangeContainer extends StatelessWidget {
  const OrangeContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      child: StarterPage(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: _color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          )
        ],
      ),
    );
  }
}

class InputDecoratorsWidget extends StatelessWidget {
  const InputDecoratorsWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 16.0,
          ),
          decoration: InputDecoration(
            labelText: "Notes",
            labelStyle: TextStyle(color: Colors.purple),
//border: UnderlineInputBorder(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple)),
            border: OutlineInputBorder(),
          ),
        ),
        Divider(
          color: Colors.lightGreen,
          height: 50.0,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Enter your notes'),
        ),
      ],
    );
  }
}

var something = List.generate(5, (index) => index ^ 2);

void navigate() {
  List<Widget> dummy = [];
}

class AppPage1 extends StatelessWidget {
  const AppPage1({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return DefaultTextStyle(
        style: HeadingTextStyle,
        child: SafeArea(
          child: Column(
            children: [
              TitleWidget(
                  big: 'Let\'s get you set up.', small: 'Create an account'),
              Text('')
            ],
          ),
        ));
  }
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

class RegistrationInput extends StatelessWidget {
  const RegistrationInput({super.key});

  Widget build(BuildContext context) {
    return Text('');
  }
}

// class CenterText extends Text {
//   const CenterText(
//     super.data, {
//     super.key,
//     super.style,
//     super.strutStyle,
//     super.textAlign,
//     super.textDirection,
//     super.locale,
//     super.softWrap,
//     super.overflow,
//     super.textScaleFactor,
//     super.maxLines,
//     super.semanticsLabel,
//     super.textWidthBasis,
//     super.textHeightBehavior,
//     super.selectionColor,
//   }) : super();

//   Widget build(BuildContext context) {
//     return Text(
//       super.data as String,
//       textAlign: TextAlign.center,
//     );

//     widgt _super = super.build(context);

//   }
// }
