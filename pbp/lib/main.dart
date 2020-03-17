import 'package:flutter/material.dart';
import 'package:pbp/game/data/post_provider.dart';
import 'package:pbp/game/views/post_view.dart';
import 'package:pbp/games/data/game_provider.dart';
import 'package:pbp/games/view/game_list.dart';
import 'package:pbp/login/login_view.dart';
import 'package:provider/provider.dart';

import 'games/data/game.dart';
var list = new List<Game>();
var gameProvider = GameProvider(list);
void main() {
  list.add(Game("Initial Game Proto", "1", List<Player>(), 0, true, false));
  runApp(MultiProvider(
      providers: [
        Provider(create: (_) => UserStore()),
        Provider(create: (_) => gameProvider,),
        Provider(create: (_) => PostProvider(gameProvider),)
      ],
      child: MaterialApp(
        // Start the app with the "/" named route. In this case, the app starts
        // on the FirstScreen widget.
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => LoginView(),
          '/games': (context) => GameList(),
          '/game': (context) => GameView()
        },
      )));
}
