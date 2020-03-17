class Game {
  String title;
  String id;
  List<Player> players;
  int postCount;
  bool active;
  bool waitingOnUser;

  Game(String title, String id, List<Player> players, int postCount, bool active, bool waitingOnUser){
    this.title = title;
    this.id = id;
    this.players = players;
    this.postCount = postCount;
    this.active = active;
    this.waitingOnUser = waitingOnUser;
  }
  
}


class Player {
  String id;
  String name;
  Roles role;
  String characterName;
}

enum Roles {
  player,
  dm
}