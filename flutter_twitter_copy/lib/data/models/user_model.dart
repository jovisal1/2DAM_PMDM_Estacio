import 'package:flutter_twitter_copy/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.username,
    required super.following,
    super.avatar,
    // required super.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      username: json['username'] as String,
      following: List<String>.from(json['following'] ?? []),
      avatar: json['avatar'] as String? ?? "NO_AVATAR",
      // password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'following': following,
      'avatar': avatar,
      // 'password': password,
    };
  }
}
