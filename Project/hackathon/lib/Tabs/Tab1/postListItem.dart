import 'package:flutter/material.dart';
import 'package:hackathon/Tabs/Tab1/postModal.dart';
import 'package:hackathon/Tabs/Tab1/onTapPost.dart';

class PostListItem extends StatelessWidget {
  final PostModal _postModal;

  PostListItem(this._postModal);

  @override
  Widget build(BuildContext context) {
    
    return new ListTile(
      onTap:  () {
          var route = new MaterialPageRoute(
            builder: (BuildContext context) =>
                new OnTapPost(name: _postModal.fullName, email:_postModal.email),
          );
          Navigator.of(context).push(route);
        },
        leading: new Image.asset('assets/images/logo.png'),
        title: new Text(_postModal.fullName),
        subtitle: new Text(_postModal.email)
    );
        
  }
}