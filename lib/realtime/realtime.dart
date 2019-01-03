import 'package:flutter/material.dart';

//Pages
import './create/create.dart';
import './delete/delete.dart';
import './read/read.dart';
import './update/update.dart';

class Realtime extends StatefulWidget {
  _RealtimeState createState() => _RealtimeState();
}

class _RealtimeState extends State<Realtime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Realtime"),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            color: Colors.green,
            child: Text(
              "Create",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              nextScreen(Create());
            },
          ),
          FlatButton(
            color: Colors.blue,
            child: Text(
              "Read",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              nextScreen(Read());
            },
          ),
          FlatButton(
            color: Colors.teal,
            child: Text(
              "Update",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              nextScreen(Update());
            },
          ),
          FlatButton(
            color: Colors.red,
            child: Text(
              "Delete",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              nextScreen(Delete());
            },
          ),
        ],
      ),
    );
  }

  nextScreen(var screen) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}
