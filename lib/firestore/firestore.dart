import 'package:flutter/material.dart';

//Pages
import './create/create.dart';
import './delete/delete.dart';
import './read/read.dart';
import './update/update.dart';

class Firestore extends StatefulWidget {
  _FirestoreState createState() => _FirestoreState();
}

class _FirestoreState extends State<Firestore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firestore"),
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
