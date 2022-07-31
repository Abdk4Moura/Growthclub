import 'package:flutter/material.dart';

class StarterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Background'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/1.png"), fit: BoxFit.cover)),
        //image: NetworkImage(
        //"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQXDPKPH6IhukvE5AAx-L3_bwhAIKfiV0fI64LrZBqfLg4XclKGe6kjOZqbNpfQ4jRx5QRkguEDMGxxqjTk5QGUa8FrgEJS&usqp=CAU"),
        child: TextField(
          decoration: InputDecoration(fillColor: Colors.amber, filled: true),
        ),
      ),
    );
  }
}
