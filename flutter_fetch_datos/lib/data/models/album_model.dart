import 'package:flutter_fetch_datos/domain/entities/album.dart';

class AlbumModel {
  final int userId;
  final int id;
  final String title;

  const AlbumModel({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) =>
      AlbumModel(userId: json['userId'], id: json['id'], title: json['title']);

  Album toAlbumEntity() => Album(userId: userId, id: id, title: title);
}
