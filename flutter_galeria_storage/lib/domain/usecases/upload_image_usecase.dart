import 'package:dartz/dartz.dart';
import 'package:flutter_galeria_storage/domain/repositories/image_repository.dart';

class UploadImageUseCase {
  final ImageRepository repository;

  UploadImageUseCase(this.repository);

  Future<Either<Exception, void>> call(dynamic file, String fileName) {
    return repository.uploadImage(file, fileName);
  }
}
