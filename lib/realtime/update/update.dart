import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class Update extends StatefulWidget {
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  bool isLoading = true;
  String keyToUpdate = "";
  DatabaseReference itemRef;
  Item item;
  List<Item> items = List();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    itemRef = FirebaseDatabase.instance.reference().child('items');
    itemRef.once().then((DataSnapshot snapshot) {
      print("My key ${snapshot.key}");
      items.add(Item.fromSnapshot(snapshot));
    }).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    }).catchError((error) {
      print(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Update"),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: formKey,
                  child: Flex(
                    direction: Axis.vertical,
                    children: <Widget>[
                      TextFormField(
                        initialValue: "",
                        validator: (val) => null,
                        onSaved: (val) => null,
                      ),
                      TextFormField(
                        initialValue: "",
                        validator: (val) => null,
                        onSaved: (val) => null,
                      ),
                      // customDropdownMenu(context),
                      FlatButton(
                        child: Text('Update'),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ));
  }

  Widget customDropdownMenu(BuildContext context) {
    return new DropdownButton<String>(
      value: keyToUpdate.isEmpty ? "Select item" : keyToUpdate,
      items: items.map((value) {
        return new DropdownMenuItem<String>(
          value: value.key,
          child: new Text('${value.title}'),
        );
      }).toList(),
      onChanged: (val) {
        print(val);
      },
    );
  }
}

class Item {
  String key;
  String title;
  String body;

  Item({this.title, this.body});

  Item.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        title = snapshot.value['title'],
        body = snapshot.value['body'];

  toJson() {
    return {"title": title, "body": body};
  }
}
