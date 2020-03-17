import 'dart:async';

import 'package:pbp/game/data/post.dart';
import 'package:pbp/games/data/game_provider.dart';

class PostProvider {
  GameProvider gameProvider;
  StreamController<List<Post>> streamController =
      new StreamController.broadcast(); //Add .broadcast here

  PostProvider(GameProvider game) {
    this.gameProvider = game;
    List<Post> posts = new List<Post>();
    posts.add(Post("0", "GENERIC"));
    streamController.add(posts);
  }

  Stream<List<Post>> getPosts() {
    return streamController.stream;
  }

  void dispose() {
    streamController.close();
  }
}
