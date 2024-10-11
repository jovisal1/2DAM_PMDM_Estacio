import 'package:flutter_fetch_datos/domain/entities/album.dart';

abstract class AlbumsRepository {
  Future<List<Album>> getAllAlbums();
}
