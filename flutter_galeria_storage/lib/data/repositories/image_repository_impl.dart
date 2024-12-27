import 'package:dartz/dartz.dart';
import 'package:flutter_galeria_storage/data/datasources/firebase_storage_datasource.dart';
import 'package:flutter_galeria_storage/domain/entities/image_entity.dart';
import 'package:flutter_galeria_storage/domain/repositories/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final FirebaseStorageDataSource dataSource;

  ImageRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Exception, List<ImageEntity>>> fetchImages() async {
    try {
      final imagesData = await dataSource.fetchImages();
      final images = imagesData
          .map((image) => ImageEntity(id: image['id']!, url: image['url']!))
          .toList();
      return Right(images);
    } catch (e) {
      return Left(Exception('Failed to fetch images: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> uploadImage(
      dynamic file, String fileName) async {
    try {
      await dataSource.uploadImage(file, fileName);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to upload image: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> deleteImage(String id) async {
    try {
      await dataSource.deleteImage(id);
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to delete image: $e'));
    }
  }
}
