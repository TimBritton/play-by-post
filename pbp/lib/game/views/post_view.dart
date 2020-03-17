import 'package:flutter/material.dart';
import 'package:pbp/game/data/post.dart';
import 'package:pbp/game/data/post_provider.dart';
import 'package:pbp/games/data/game_provider.dart';
import 'package:provider/provider.dart';

class GameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PostProvider posts = Provider.of(context);
    GameProvider game = Provider.of(context);
    TextEditingController quickMessage = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("${game.selected.title}"),
        bottom: TabBar();
      ),
      body: Column(
        children: <Widget>[
          
          StreamBuilder(
            initialData: List<Post>(),
            stream: posts.getPosts(),
            builder: (context, items) {
              if (items.data.length == 0) {
                return Text("Nothing here yet....");
              } else {
                return ListView.builder(
                    itemCount: items.data.length,
                    itemBuilder: (context, index) {
                      var post = items.data[index];
                      return post.render(context);
                    });
              }
            },
          ),
          Row(
            children: <Widget>[
              TextField(
                controller: quickMessage,
              ),
              FlatButton(
                onPressed: () {},
                child: Icon(Icons.send),
              ),
              FlatButton(
                onPressed: () {},
                child: Icon(Icons.add),
              )
            ],
          ),
        ],
      ),
    );
  }
}
