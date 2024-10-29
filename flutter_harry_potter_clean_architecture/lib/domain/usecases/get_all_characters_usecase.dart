import 'package:dartz/dartz.dart';
import 'package:flutter_harry_potter_clean_architecture/domain/entities/character.dart';
import 'package:flutter_harry_potter_clean_architecture/domain/repositories/character_repository.dart';

class GetAllCharacters {
  final CharacterRepository repository;

  GetAllCharacters(this.repository);

  Future<Either<Exception, List<Character>>> call() async {
    return await repository.getAllCharacters();
  }
}
