import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_galeria_storage/presentation/blocs/image_bloc/image_bloc.dart';
import 'package:flutter_galeria_storage/presentation/blocs/image_bloc/image_event.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageBtn extends StatelessWidget {
  const UploadImageBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final picker = ImagePicker();
        final pickedFile = await picker.pickImage(source: ImageSource.gallery);

        if (pickedFile != null) {
          final fileName = pickedFile.name;
          if (kIsWeb) {
            // Leer como Uint8List para web
            final fileBytes = await pickedFile.readAsBytes();
            if (context.mounted) {
              context.read<ImageBloc>().add(UploadImage(fileBytes, fileName));
            }
          } else {
            // Usar la ruta del archivo en móviles/escritorio
            if (context.mounted) {
              context
                  .read<ImageBloc>()
                  .add(UploadImage(pickedFile.path, fileName));
            }
          }
        }
      },
      child: const Icon(Icons.add),
    );
  }
}
