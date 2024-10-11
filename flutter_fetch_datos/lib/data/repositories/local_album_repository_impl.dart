import 'package:flutter_fetch_datos/data/datasources/local_album_datasources_impl.dart';
import 'package:flutter_fetch_datos/domain/entities/album.dart';
import 'package:flutter_fetch_datos/domain/repositories/albums_repository.dart';

class LocalAlbumRepositoryImpl implements AlbumsRepository {
  late final LocalAlbumDatasource albumsDatasource;

  LocalAlbumRepositoryImpl() {
    albumsDatasource = LocalAlbumDatasource();
  }

  @override
  Future<List<Album>> getAllAlbums() {
    return albumsDatasource.getAllAlbums();
  }
}
