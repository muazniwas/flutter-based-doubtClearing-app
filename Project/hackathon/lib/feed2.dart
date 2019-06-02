import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
// import 'package:hackathon/Tabs/tab1.dart';
// import 'package:hackathon/Tabs/tab2.dart';
// import 'package:hackathon/Tabs/tab3.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackathon/page_transformer.dart';
import 'Tabs/Tab2/item.dart';
// import 'Tabs/Tab2/item2.dart';
// import 'Tabs/Tab2/onTap.dart';
import 'Tabs/Tab2/onTap2.dart';
import 'Tabs/Tab2/onTapAddPost.dart';
import 'intro_page_item.dart';

class Feed2 extends StatefulWidget {

   final FirebaseUser user;
  Feed2({Key key, this.user}) : super(key: key);

  @override
  Feed2State createState() => Feed2State(); 

}

class Feed2State extends State<Feed2>{

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
    bool pressed = true;
        return Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.black,
          title: new Text("All Questions"),
          ),
          backgroundColor: Colors.black,
          body: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
              // size: const Size.fromHeight(500.0),
              child: PageTransformer(
                pageViewBuilder: (context, visibilityResolver) {
                  return PageView.builder(
                    controller: PageController(viewportFraction: 0.90),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final  item = items[index];
                      final pageVisibility =visibilityResolver.resolvePageVisibility(index);
                      final sampleChild=new IntroPageItem(
                          item: item,
                          pageVisibility: pageVisibility,
                      );
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OnTap2(
                                userEmail:widget.user.email,
                                k:widget.user.uid,
                              )
                            )
                          );
                        },
                        child: sampleChild,
                      );
                    },
                  );
                },
              ),
            ),
            RaisedButton(
              child: Text('Tap to ask your own question',
                            textAlign: TextAlign.center,
                            style: pressed ? TextStyle(fontStyle: FontStyle.italic,color: Colors.white): TextStyle(fontStyle: FontStyle.italic,color:Colors.green),
                            ),
              color: Colors.black, //specify background color for the button here
              colorBrightness: Brightness
                  .dark, //specify the color brightness here, either `Brightness.dark` for darl and `Brightness.light` for light
              disabledColor:
                  Colors.black,
                  splashColor:Colors.black , // specify color when the button is disabled
              highlightColor: Colors
                  .black,
                  padding: EdgeInsets.symmetric(
                  horizontal: 10.0, vertical: 15.0),
              
              onPressed: () {
                // pressed = !pressed;
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => OnTapAddPost(
                    userEmail:widget.user.email,
                    k:widget.user.uid,
                    )
                  )
                );
              },
            ),
        ],
      ),
    );
  }
}