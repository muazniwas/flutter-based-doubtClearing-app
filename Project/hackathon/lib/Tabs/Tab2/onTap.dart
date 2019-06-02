import 'package:flutter/material.dart';
// import 'package:flip_card/flip_card.dart';

class OnTapPost extends StatefulWidget {
  final String title;
  final String body;

  OnTapPost({Key key, this.title,this.body}) : super(key: key);

  @override
  OnTapPageState createState() => new OnTapPageState();
}

class OnTapPageState extends State<OnTapPost> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: new Text("${widget.title}"),
      ),
      body: Column(
        children: <Widget>[
          Text("${widget.title} \n\n ${widget.body}",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),)
        ],
        
      )
    );
  }
}
