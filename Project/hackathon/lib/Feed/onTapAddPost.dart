import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'item.dart';
import 'onTapListItem.dart';

class OnTapAddPost extends StatefulWidget {
  final String userEmail;
  final String k;

  OnTapAddPost({Key key, this.userEmail,this.k}) : super(key: key);
  @override
  OnTapAddPostState createState() => OnTapAddPostState(); 
}
class OnTapAddPostState extends State<OnTapAddPost>{
  List<Item> items = List();
  Item item;
  DatabaseReference itemRef,itemRef2;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    item = Item("", "");
    final FirebaseDatabase database = FirebaseDatabase.instance; //Rather then just writing FirebaseDatabase(), get the instance.  
    itemRef = database.reference().child(widget.k).child('Posts');
    itemRef.onChildAdded.listen(_onEntryAdded);
    itemRef.onChildChanged.listen(_onEntryChanged);

    itemRef2 = database.reference().child('Posts');
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

  void handleSubmit() {
    final FormState form = formKey.currentState;

    if (form.validate()) {
      form.save();
      form.reset();
      itemRef.push().set(item.toJson());
      itemRef2.push().set(item.toJson());
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Ask Your Question'),
      ),
     body: Column(
        children: <Widget>[
          Flexible(
            flex: 0,
            child: Center(
              child: Form(
                key: formKey,
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.all_out,color: Colors.black),
                      
                      title: TextFormField(
                        initialValue: "",
                        onSaved: (val) => item.title = val,
                        validator: (val) => val == "" ? val : null,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.all_out,color: Colors.black,),
                      title: TextFormField(
                        initialValue: '',
                        onSaved: (val) => item.body = val,
                        validator: (val) => val == "" ? val : null,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send,color: Colors.black),
                      onPressed: () {
                        handleSubmit();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Text("Ask"),
          
          
           Divider(),
         
          
           Text("Your Previous Questions",style: TextStyle(fontSize: 20),),
          
          Flexible(
            child: FirebaseAnimatedList(
              query: itemRef,
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