import 'package:flutter/material.dart';
import 'package:flutter_fetch_datos/domain/entities/album.dart';
import 'package:flutter_fetch_datos/data/repositories/local_album_repository_impl.dart';
import 'package:flutter_fetch_datos/domain/usecases/get_all_albums.dart';
import 'package:flutter_fetch_datos/presentation/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MainAppState();
}

class _MainAppState extends State<HomeScreen> {
  Future<List<Album>> albumsList =
      GetAllAlbums(albumsRepository: LocalAlbumRepositoryImpl()).call();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Listado de Álbums'),
        ),
        body: Center(
          child: FutureBuilder(
            future: albumsList,
            builder:
                (BuildContext context, AsyncSnapshot<List<Album>> snapshot) {
              if (snapshot.hasData) {
                List<Album> listadoAlbums = snapshot.data!;
                return Center(
                    child: AlbumsListWidget(listadoAlbums: listadoAlbums));
              } else if (snapshot.hasError) {
                return ErrorResponseWidget(error: snapshot.error);
              } else {
                return const LoadingResponseWidget();
              }
            },
          ),
        ),
      ),
    );
  }
}
