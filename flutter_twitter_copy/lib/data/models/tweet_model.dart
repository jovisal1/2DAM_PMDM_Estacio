import '../../domain/entities/tweet.dart';

class TweetModel extends Tweet {
  TweetModel({
    required super.id,
    required super.userId,
    required super.content,
    required super.createdAt,
    required super.likes,
    super.image,
    super.userAvatar,
  });

  factory TweetModel.fromJson(Map<String, dynamic> json) {
    return TweetModel(
      id: json['id'],
      userId: json['userId'],
      content: json['content'],
      createdAt: DateTime.parse(json['createdAt']),
      likes: json['likes'] ?? [],
      image: json['image'],
      userAvatar: json['userAvatar'],
    );
  }
}
