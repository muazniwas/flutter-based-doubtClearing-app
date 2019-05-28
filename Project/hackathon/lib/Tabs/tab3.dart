import 'package:flutter/material.dart';

class Tab3 extends StatelessWidget {
  final String userEmail;
  final String k;

  Tab3({Key key, this.userEmail,this.k}) : super(key: key);


  @override
  Widget build(BuildContext context){
    return new Container(
      child: new Center(
        child: new Text("Hi $userEmail and my key is $k"),
      )
    );
  }
}