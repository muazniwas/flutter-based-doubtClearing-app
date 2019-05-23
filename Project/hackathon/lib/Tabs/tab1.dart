import 'package:flutter/material.dart';
import 'package:hackathon/Tabs/Tab1/postList.dart';
import 'package:hackathon/Tabs/Tab1/postModal.dart';

class Tab1 extends StatelessWidget {
   _buildPostList() {
    return <PostModal>[
      const PostModal(
          fullName: 'Romain Hoogmoed', email: 'romain.hoogmoed@example.com'),
      const PostModal(
          fullName: 'Emilie Olsen', email: 'emilie.olsen@example.com'),
      const PostModal(
          fullName: 'Nishant Srivastava', email: 'nishant.srivastava@example.com'),
      const PostModal(
          fullName: 'Romain Hoogmoed', email: 'romain.hoogmoed@example.com'),
      const PostModal(
          fullName: 'Emilie Olsen', email: 'emilie.olsen@example.com'),
      const PostModal(
          fullName: 'Nishant Srivastava', email: 'nishant.srivastava@example.com'),
      const PostModal(
          fullName: 'Romain Hoogmoed', email: 'romain.hoogmoed@example.com'),
      const PostModal(
          fullName: 'Emilie Olsen', email: 'emilie.olsen@example.com'),
      const PostModal(
          fullName: 'Nishant Srivastava', email: 'nishant.srivastava@example.com'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: new PostList(_buildPostList()));
  }
}