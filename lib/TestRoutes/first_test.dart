import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyFirstTestHomePage extends StatefulWidget {
  const MyFirstTestHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyFirstTestHomePage> {
// ...
  void _updateSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1;

    print('Pressed $counter times.');
    await prefs.setInt('counter', counter);
  }

  @override
  Widget build(BuildContext context) {
    return const Text('Nothing');
  }
// ...
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Widget Scaffee = Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.lightGreen.shade500,
      leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
      ],
      flexibleSpace: const SafeArea(
        child: Icon(
          Icons.photo_camera,
          size: 100,
          color: Colors.white70,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: Container(
          color: Colors.lightGreen.shade100,
          height: 75.0,
          width: double.infinity,
          child: const Center(
            child: Text('Bottom'),
          ),
        ),
      ),
    ),
    body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row1,
              const Padding(
                padding: EdgeInsets.all(16.0),
              ),
              YOBRow,
            ],
          ),
        ),
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    floatingActionButton: FloatingActionButton(
      tooltip: 'Play this',
      onPressed: () {},
      child: const Icon(Icons.play_arrow),
      backgroundColor: Colors.lightGreen.shade100,
    ),
    bottomNavigationBar: const BottomAppBar(child: ButtonBarWidget()));

class FirstBottomBarWidget extends StatelessWidget {
  const FirstBottomBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 2,
      color: Colors.lightGreen.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Icon(Icons.pause),
          const Icon(Icons.stop),
          const Icon(Icons.access_time),
          const Padding(
            padding: EdgeInsets.all(32.0),
          ),
        ],
      ),
    );
  }
}

Row Row1 = Row(
  children: <Widget>[
    Container(
      color: Colors.yellow,
      height: 40.0,
      width: 40.0,
    ),
    cPadding(),
    Expanded(
      child: Container(
        color: Colors.amber,
        height: 40.0,
        width: 40.0,
      ),
    ),
    cPadding(),
    Container(
      color: Colors.brown,
      height: 40.0,
      width: 40.0,
    ),
  ],
);

Row YOBRow = Row(
  children: <Widget>[
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          color: Colors.yellow,
          height: 60.0,
          width: 60.0,
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
        ),
        Container(
          color: Colors.amber,
          height: 40.0,
          width: 40.0,
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
        ),
        Container(
          color: Colors.brown,
          height: 20.0,
          width: 50.0,
        ),
        const Divider(),
        avatarWidget(),
        const Divider(),
        const Text('End of the Line'),
        CommentContainer(),
        const Padding(
          padding: EdgeInsets.all(30),
        ),
        const ColumnAndRowNestingWidget(),
        cPadding(),
        newStyleSection,
        cPadding(),
        Row(
          children: [
            RButton1,
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            Rbutton(const Icon(Icons.save), color: Colors.green),
          ],
        )
      ],
    ),
  ],
);

class CommentContainer extends StatefulWidget {
  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<CommentContainer> {
  @override
  Widget build(BuildContext context) {
    var center = const Center(
      child: Text(
        'EXAMPLE TEXT',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
    return Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.amber,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 32, 32, 32),
              blurRadius: 5.0,
              offset: Offset(0.0, 4.0),
            )
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: center);
  }
}

Padding cPadding() {
  return const Padding(
    padding: EdgeInsets.all(16.0),
  );
}

Row avatarWidget() {
  Container container1 = Container(
    height: 100.0,
    width: 100.0,
    color: Colors.yellow,
  );
  Container container2 = Container(
    height: 60.0,
    width: 60.0,
    color: Colors.amber,
  );
  Container container3 = Container(
    height: 40.0,
    width: 40.0,
    color: Colors.brown,
  );

  return Row(
    children: <Widget>[
      CircleAvatar(
        backgroundColor: Colors.lightGreen,
        radius: 100.0,
        child: Stack(
          children: <Widget>[
            container1,
            container2,
            container3,
          ],
        ),
      ),
    ],
  );
}

Widget newStyleSection = Container(
  height: 100.0,
  width: 100.0,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    color: Colors.orange,
    boxShadow: [
      BoxShadow(
        color: Colors.grey,
        blurRadius: 10.0,
        offset: Offset(0.0, 10.0),
      )
    ],
  ),
);

class ColumnAndRowNestingWidget extends StatelessWidget {
  const ColumnAndRowNestingWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const Text(
            'Columns and Row Nesting 1',
          ),
          const Text(
            'Columns and Row Nesting 2',
          ),
          const Text(
            'Columns and Row Nesting 3',
          ),
          Container(
            width: 500,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text('Row Nesting '),
                const Text('Row Nesting 2'),
                const Text('Row Nesting 3'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

ElevatedButton RButton1 = Rbutton(const Text('Save'));

ElevatedButton Rbutton(Widget child, {Color color: Colors.blue}) {
  return ElevatedButton(
    onPressed: () {},
    child: child,
    style: ElevatedButton.styleFrom(primary: color),
  );
}

class ButtonBarWidget extends StatelessWidget {
  const ButtonBarWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.map),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.airport_shuttle),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.brush),
            highlightColor: Colors.purple,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
