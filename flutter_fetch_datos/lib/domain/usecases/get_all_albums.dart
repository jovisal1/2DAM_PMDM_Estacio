import 'package:flutter_fetch_datos/domain/entities/album.dart';
import 'package:flutter_fetch_datos/domain/repositories/albums_repository.dart';

class GetAllAlbums {
  AlbumsRepository albumsRepository;

  GetAllAlbums({
    required this.albumsRepository,
  });

  Future<List<Album>> call() async {
    List<Album> list = await albumsRepository.getAllAlbums();
    return list;
  }
}
