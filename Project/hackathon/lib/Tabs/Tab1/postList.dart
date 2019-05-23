import 'package:flutter/material.dart';
import 'package:hackathon/Tabs/Tab1/postModal.dart';
import 'package:hackathon/Tabs/Tab1/postListItem.dart';

class PostList extends StatelessWidget {
  final List<PostModal> _postModal;

  PostList(this._postModal);

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: getPostList(),
    );
  }
  
// @override
//   Widget build(BuildContext context) {
//     return new CustomScrollView(
//       // physics: FixedExtentScrollPhysics(),
//         slivers: <Widget>[
//           const SliverAppBar(
//             pinned: true,
//             expandedHeight: 250.0,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text('Demo'),
//             ),
//           ),
//           SliverFixedExtentList(
//             itemExtent: 50.0,
//             delegate: SliverChildListDelegate(
//                getPostList()
//             ),
//           ),
//         ],
//       );
//   }


// @override
//   Widget build(BuildContext context) {
//     return new ListWheelScrollView(
//       physics:FixedExtentScrollPhysics(),
//       children: getPostList(),
//       itemExtent: 100.0,
//     );
//   }

  List<PostListItem> getPostList() {
    return _postModal
        .map((contact) => new PostListItem(contact))
        .toList();
  }
}