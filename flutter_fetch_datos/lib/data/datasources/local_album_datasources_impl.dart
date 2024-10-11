import 'package:flutter_fetch_datos/data/models/album_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_fetch_datos/domain/entities/album.dart';

class LocalAlbumDatasource {
  Future<List<Album>> getAllAlbums() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    if (response.statusCode == 200) {
      List<Album> albumsList = List<Album>.from(json
          .decode(response.body)
          .map((album) => AlbumModel.fromJson(album).toAlbumEntity()));

      return albumsList;
    } else {
      //Si el servidor retorna un código que no es 200 consideramos que se ha producido un error
      throw Exception('Error al cargar el listado de albums');
    }
  }
}
