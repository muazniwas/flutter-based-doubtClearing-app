import 'package:flutter/material.dart';
import 'package:hackathon/Tabs/Tab2/item.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

import 'Tab2/onTap.dart';

class Tab1 extends StatefulWidget {
  final String userEmail;
  final String k;

  Tab1({Key key, this.userEmail,this.k}) : super(key: key);
  @override
  Tab1State createState() => Tab1State(); 
}
class Tab1State extends State<Tab1>{
  List<Item> items = List();
  Item item;
  DatabaseReference itemRef,itemRef2;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    item = Item("", "");
    final FirebaseDatabase database = FirebaseDatabase.instance; //Rather then just writing FirebaseDatabase(), get the instance.  

    itemRef2 = database.reference().child('Posts');
    itemRef2.onChildAdded.listen(_onEntryAdded);
    itemRef2.onChildChanged.listen(_onEntryChanged);
  }

  _onEntryAdded(Event event) {
    setState(() {
      items.add(Item.fromSnapshot(event.snapshot));
    });
  }

  _onEntryChanged(Event event) {
    var old = items.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });
    setState(() {
      items[items.indexOf(old)] = Item.fromSnapshot(event.snapshot);
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
     body: Column(
        children: <Widget>[
          Flexible(
            child: FirebaseAnimatedList(
              query: itemRef2,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return new ListTile(
                  onTap: () {
                    var route = new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new OnTapPost(title: items[index].title, body:items[index].body),
                    );
                    Navigator.of(context).push(route);
                  },
                  leading: Icon(Icons.message),
                  title: Text(items[index].title),
                  subtitle: Text(items[index].body),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}