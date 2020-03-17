import 'package:flutter/material.dart';

class Post {
  String id;
  String type;

  Post(String id, String type) {
    this.id = id;
    this.type = type;
  }

  Widget render(context) {
    return Text("$id $type");
  }
}

class ScenePost extends Post {
  String markdown;
  String authorId;

  ScenePost(String markdown, String authorId, String id) : super(id, "SCENE") {
    this.markdown = markdown;
    this.authorId = authorId;
  }
}
