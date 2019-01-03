import 'package:flutter/material.dart';

//Pages
import './firestore/firestore.dart';
import './realtime/realtime.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            color: Colors.teal,
            child: Text("Realtime"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Realtime()),
              );
            },
          ),
          FlatButton(
            color: Colors.yellow,
            child: Text("Cloud Firestore"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Firestore()),
              );
            },
          )
        ],
      ),
    );
  }
}
