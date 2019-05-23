import 'package:flutter/material.dart';

class OnTapPost extends StatefulWidget {
  final String name;
  final String email;



  OnTapPost({Key key, this.name,this.email}) : super(key: key);

  @override
  OnTapPageState createState() => new OnTapPageState();
}

class OnTapPageState extends State<OnTapPost> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Next Page"),
      ),
      body: Text(
        "${widget.name} with the email ${widget.email}",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      )
    );
  }
}

