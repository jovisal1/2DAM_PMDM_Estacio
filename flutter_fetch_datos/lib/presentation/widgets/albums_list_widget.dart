import 'package:flutter/material.dart';
import 'package:flutter_fetch_datos/domain/entities/album.dart';

class AlbumsListWidget extends StatelessWidget {
  final List<Album> listadoAlbums;

  const AlbumsListWidget({super.key, required this.listadoAlbums});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listadoAlbums.length,
      itemBuilder: (BuildContext context, int index) {
        Album albumSeleccionado = listadoAlbums[index];
        return Card(
          child: ListTile(
            leading: const FlutterLogo(),
            title: Text(albumSeleccionado.title),
            subtitle: Text(albumSeleccionado.userId.toString()),
          ),
        );
      },
    );
  }
}
