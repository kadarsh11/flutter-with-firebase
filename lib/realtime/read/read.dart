import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class Read extends StatefulWidget {
  _ReadState createState() => _ReadState();
}

class _ReadState extends State<Read> {
  DatabaseReference itemRef;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemRef = FirebaseDatabase.instance.reference().child('items');
    // itemRef.onChildAdded.listen(_onEntryAdded);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Read"),
        ),
        body: Flex(direction: Axis.vertical, children: [
          Flexible(
            child: FirebaseAnimatedList(
              physics: ScrollPhysics(parent: BouncingScrollPhysics()),
              query: itemRef,
              defaultChild: Center(child: CircularProgressIndicator()),
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return ListTile(
                  leading: Icon(Icons.message),
                  title: Text(snapshot.value['title']),
                  trailing: Text(snapshot.value['body']),
                );
              },
            ),
          ),
        ]));
  }
}
