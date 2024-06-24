class Player {
  final String id;
  final String name;
  final int score;

  Player({required this.id, required this.name, required this.score});

  factory Player.fromMap(Map<String, dynamic> data, String id) {
    return Player(
      id: id,
      name: data['name'],
      score: data['score'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'score': score,
    };
  }
}
