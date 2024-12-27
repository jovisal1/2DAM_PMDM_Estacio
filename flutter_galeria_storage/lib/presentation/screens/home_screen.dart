import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_galeria_storage/presentation/blocs/image_bloc/image_bloc.dart';
import 'package:flutter_galeria_storage/presentation/blocs/image_bloc/image_state.dart';
import 'package:flutter_galeria_storage/presentation/widgets/images_grid_widget.dart';
import 'package:flutter_galeria_storage/presentation/widgets/upload_image_btn.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Galería')),
      body: BlocBuilder<ImageBloc, ImageState>(
        builder: (context, state) {
          if (state is ImageLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ImageLoaded) {
            return ImagesGridWidget(images: state.images);
          } else if (state is ImageError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      floatingActionButton: UploadImageBtn(),
    );
  }
}
