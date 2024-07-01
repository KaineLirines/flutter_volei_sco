class Player{
  int score;
  String name;

  Player({
    required this.score,
    required this.name,
    });

  Player.fromMap(Map<String, dynamic> map)
  : score = map ["score"], 
    name = map["name"];

  Map<String, dynamic> toMap() {
    return {
      "score": score,
      "name": name,
    };
  }
}