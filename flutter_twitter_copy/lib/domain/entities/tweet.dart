class Tweet {
  final String id;
  final String userId;
  final String content;
  final DateTime createdAt;
  final List<dynamic> likes;
  final String? image;
  final String? userAvatar;

  Tweet(
      {required this.id,
      required this.userId,
      required this.content,
      required this.createdAt,
      required this.likes,
      this.image,
      this.userAvatar});
}
