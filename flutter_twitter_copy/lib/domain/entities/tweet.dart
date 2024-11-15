class Tweet {
  final String id;
  final String userId;
  final String content;
  final DateTime createdAt;
  final int likes;
  final String? image;

  Tweet({
    required this.id,
    required this.userId,
    required this.content,
    required this.createdAt,
    required this.likes,
    this.image,
  });
}
