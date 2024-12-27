import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_galeria_storage/domain/entities/image_entity.dart';
import 'package:flutter_galeria_storage/presentation/blocs/image_bloc/image_bloc.dart';
import 'package:flutter_galeria_storage/presentation/blocs/image_bloc/image_event.dart';

class ImagesGridWidget extends StatelessWidget {
  final List<ImageEntity> images;

  const ImagesGridWidget({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: images.length,
      itemBuilder: (context, index) {
        final image = images[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onLongPress: () {
              context.read<ImageBloc>().add(DeleteImage(image.id));
            },
            child: Image.network(image.url, fit: BoxFit.cover),
          ),
        );
      },
    );
  }
}
