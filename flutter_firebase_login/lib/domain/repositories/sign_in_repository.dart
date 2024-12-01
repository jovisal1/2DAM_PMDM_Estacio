import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_login/core/failure.dart';
import 'package:flutter_firebase_login/data/models/user_model.dart';
import 'package:flutter_firebase_login/domain/entities/user_entity.dart';

abstract class SignInRepository {
  Future<Either<Failure, UserEntity>> signIn(String email, String password);
  Future<Either<Failure, String>> isLoggedIn();
  Future<Either<Failure, void>> logout();
}
