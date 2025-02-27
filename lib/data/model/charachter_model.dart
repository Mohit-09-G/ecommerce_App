class Character {
  final int id;
  final String name;

  final String species;
  final String gender;
  final String image;

  Character({
    required this.id,
    required this.name,
    required this.species,
    required this.gender,
    required this.image,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      species: json['species'],
      gender: json['gender'],
      image: json['image'],
    );
  }
}

class Characters {
  final List<Character> results;

  Characters({required this.results});

  factory Characters.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<Character> characterList =
        list.map((i) => Character.fromJson(i)).toList();

    return Characters(results: characterList);
  }
}
