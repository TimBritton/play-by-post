import 'package:flutter/material.dart';
import 'package:pbp/games/data/game.dart';
import 'package:pbp/games/data/game_provider.dart';
import 'package:pbp/login/login_view.dart';
import 'package:provider/provider.dart';

class GameList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GameProvider games = Provider.of<GameProvider>(context);
    UserStore userStore = Provider.of<UserStore>(context);
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text("Games"),
        ),
        body: FutureBuilder(
          future: games.getGames(userStore.uid),
          builder: (context, asyncResult) {
            if (asyncResult.error == null) {
              List<Game> gs = asyncResult.data;
              return ListView.builder(
                  itemCount: gs.length,
                  itemBuilder: (context, i) {
                    Game game = gs[i];
                    return Card(
                        child: ListTile(
                      title: Text(game.title),
                      subtitle: Text("GM"),
                      trailing:
                          game.waitingOnUser ? Text("Waiting On you") : null,
                      onTap: () {
                        games.selected = game;
                        Navigator.pushNamed(context, "/game");
                      },
                    ));
                  });
            } else {
              return Container(
                child: Text("Error Retrieving Games"),
              );
            }
          },
        ));
    ;
  }
}
