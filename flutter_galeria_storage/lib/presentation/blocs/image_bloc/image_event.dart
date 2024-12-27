abstract class ImageEvent {}

class FetchImages extends ImageEvent {}

class UploadImage extends ImageEvent {
  final dynamic
      file; // Puede ser Uint8List (web) o String (ruta de archivo en móviles/escritorio)
  final String fileName; // Nombre del archivo que se usará en Firebase Storage

  UploadImage(this.file, this.fileName);
}

class DeleteImage extends ImageEvent {
  final String id;
  DeleteImage(this.id);
}
