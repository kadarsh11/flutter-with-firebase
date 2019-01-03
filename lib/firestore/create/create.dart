import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Create extends StatefulWidget {
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  var itemRef;
  List<Item> items = List();
  Item item;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    item = Item(title: "", body: "");
    itemRef = Firestore.instance.collection('items').document();
  }

  void handleSubmit() {
    FormState form = formKey.currentState;

    if (form.validate()) {
      form.save();
      form.reset();
      itemRef.setData(item.toJson()).catchError((e) {
        print("Error $e");
      });
      print(item.toJson());
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

  toJson() {
    return {"title": title, "body": body};
  }
}
