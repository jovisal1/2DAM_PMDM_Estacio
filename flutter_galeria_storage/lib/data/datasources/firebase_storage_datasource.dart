import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

abstract class FirebaseStorageDataSource {
  Future<List<Map<String, String>>> fetchImages();
  Future<void> uploadImage(dynamic file, String fileName);
  Future<void> deleteImage(String id);
}

class FirebaseStorageDataSourceImpl implements FirebaseStorageDataSource {
  final FirebaseStorage storage;

  FirebaseStorageDataSourceImpl({required this.storage});

  @override
  Future<List<Map<String, String>>> fetchImages() async {
    try {
      final ListResult result = await storage.ref().child('images').listAll();
      final images = await Future.wait(result.items.map((ref) async {
        final url = await ref.getDownloadURL();
        return {'id': ref.name, 'url': url};
      }));

      return images;
    } catch (e) {
      throw Exception('Error al cargar las imágenes: $e');
    }
  }

  @override
  Future<void> uploadImage(dynamic file, String fileName) async {
    try {
      final Reference storageRef = storage.ref().child('images/$fileName');

      if (kIsWeb) {
        // En el entorno web
        if (file is Uint8List) {
          await storageRef.putData(file);
        } else {
          throw Exception(
              'En entornos web, el fichero debe ser de tipo Uint8List');
        }
      } else {
        // En móviles/escritorio
        if (file is String) {
          final fileBytes = await Future.delayed(
              Duration.zero, () => File(file).readAsBytesSync());
          await storageRef.putData(fileBytes);
        } else {
          throw Exception(
              'En entornos que no son web, necesitamos que el fichero sea de tipo texto');
        }
      }
    } catch (e) {
      throw Exception('Error al cargar la imagen: $e');
    }
  }

  @override
  Future<void> deleteImage(String id) async {
    try {
      final Reference storageRef = storage.ref().child('images/$id');
      await storageRef.delete();
    } catch (e) {
      throw Exception('Failed to delete image: $e');
    }
  }
}
