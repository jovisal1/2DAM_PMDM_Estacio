import 'package:flutter_galeria_storage/domain/entities/image_entity.dart';

class ImageModel extends ImageEntity {
  ImageModel({
    required super.id,
    required super.url,
  });

  factory ImageModel.fromMap(Map<String, String> map) {
    return ImageModel(
      id: map['id']!,
      url: map['url']!,
    );
  }

  Map<String, String> toMap() {
    return {
      'id': id,
      'url': url,
    };
  }
}
