class CharacterModel {
  final String name;
  final String house;
  final String image;

  CharacterModel(
      {required this.name, required this.house, required this.image});

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      name: json['name'],
      house: json['house'] ?? 'Unknown',
      image: json['image'] == ""
          ? "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Harry_Potter_wordmark.svg/1200px-Harry_Potter_wordmark.svg.png"
          : json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'house': house,
      'image': image,
    };
  }
}
