import 'package:dartz/dartz.dart';
import 'package:flutter_galeria_storage/domain/entities/image_entity.dart';

abstract class ImageRepository {
  Future<Either<Exception, List<ImageEntity>>> fetchImages();
  Future<Either<Exception, void>> uploadImage(dynamic file, String fileName);
  Future<Either<Exception, void>> deleteImage(String id);
}
