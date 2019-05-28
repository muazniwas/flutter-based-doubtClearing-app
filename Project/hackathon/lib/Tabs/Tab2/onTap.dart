import 'package:flutter/material.dart';

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
        title: new Text("${widget.title}"),
      ),
      body: Text(
        "${widget.title} \n\n ${widget.body}",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      )
    );
  }
}
