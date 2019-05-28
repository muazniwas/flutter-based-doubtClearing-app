import 'package:flutter/material.dart';

class Tab3 extends StatelessWidget {
  final String userEmail;

  Tab3({Key key, this.userEmail}) : super(key: key);


  @override
  Widget build(BuildContext context){
    return new Container(
      child: new Center(
        child: new Text("Hi $userEmail"),
      )
    );
  }
}