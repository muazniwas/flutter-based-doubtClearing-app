import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../feed.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  const Home({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Feed(user:user),
    );
  }
}