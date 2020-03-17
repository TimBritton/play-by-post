

import 'game.dart';

class GameProvider {
  List<Game> games;
  Game selected;

  Future<List<Game>> getGames(String user) async {
      return new Future.value(games);
  }

  GameProvider(List<Game> seeds){
    this.games = seeds;
  }

}