import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class Tab2 extends StatelessWidget {
  final String userEmail;

  Tab2({Key key, this.userEmail}) : super(key: key);


  @override
  Widget build(BuildContext context){
    return new Container(
      child: new Center(
        child: new Text("Hi $userEmail"),
      )
    );
  }
}