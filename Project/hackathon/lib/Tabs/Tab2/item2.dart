import 'package:firebase_database/firebase_database.dart';

class Item2 {
  String key;
  String title;
  String body;
  String sub;
  
  Item2(this.title, this.body,this.sub);

  Item2.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        title = snapshot.value["title"],
        body = snapshot.value["body"],
        sub = snapshot.value["sub"];

  toJson() {
    return {
      "title": title,
      "body": body,
      "sub": sub,
    };
  }
}