import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';

class Delete extends StatefulWidget {
  _DeleteState createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  DatabaseReference itemRef;

  @override
  void initState() {
    super.initState();

    itemRef = FirebaseDatabase.instance.reference().child('items');
    // itemRef.onChildAdded.listen(_onEntryAdded);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Delete"),
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
                  leading: InkWell(
                    child: Icon(
                      Icons.remove_circle,
                      color: Colors.red,
                    ),
                    onTap: () {
                      itemRef.child(snapshot.key).remove();
                      print("${snapshot.key} is removed");
                    },
                  ),
                  title: Text(snapshot.value['title']),
                  trailing: Text(snapshot.value['body']),
                );
              },
            ),
          ),
        ]));
  }
}
