import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class Create extends StatefulWidget {
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  List<Item> items = List();
  Item item;
  DatabaseReference itemRef;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    item = new Item(title: "", body: "");
    itemRef = FirebaseDatabase.instance.reference().child('items');
    itemRef.onChildAdded.listen(_onEntryAdded);
  }

  _onEntryAdded(Event e) {
    print(e.snapshot.key);
    setState(() {
      items.add(Item.fromSnapshot(e.snapshot));
    });
  }

  void handleSubmit() {
    FormState form = formKey.currentState;

    if (form.validate()) {
      form.save();
      form.reset();
      itemRef.push().set(item.toJson());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Flex(
              direction: Axis.vertical,
              children: [
                TextFormField(
                  initialValue: "",
                  onSaved: (val) => item.title = val,
                  validator: (val) => val == "" ? val : null,
                ),
                TextFormField(
                  initialValue: "",
                  onSaved: (val) => item.body = val,
                  validator: (val) => val == "" ? val : null,
                ),
                FlatButton(
                  child: Text("Submit"),
                  onPressed: handleSubmit,
                ),
              ],
            ),
          ),
        ));
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
