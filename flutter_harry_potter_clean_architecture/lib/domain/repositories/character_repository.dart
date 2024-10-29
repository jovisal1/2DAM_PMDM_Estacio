import 'package:dartz/dartz.dart';
import 'package:flutter_harry_potter_clean_architecture/domain/entities/character.dart';

abstract class CharacterRepository {
  Future<Either<Exception, List<Character>>> getAllCharacters();
}
