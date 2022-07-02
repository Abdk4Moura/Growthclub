import 'package:flutter/material.dart';
import 'package:growthclub/TestRoutes/starterpage.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    print(something);
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
