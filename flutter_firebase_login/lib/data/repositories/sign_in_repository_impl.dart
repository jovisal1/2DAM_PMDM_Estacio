import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_login/core/failure.dart';
import 'package:flutter_firebase_login/data/datasources/firebase_auth_datasource.dart';
import 'package:flutter_firebase_login/data/models/user_model.dart';
import 'package:flutter_firebase_login/domain/repositories/sign_in_repository.dart';

class SignInRepositoryImpl implements SignInRepository {
  final FirebaseAuthDataSource dataSource;

  SignInRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, UserModel>> signIn(
      String email, String password) async {
    try {
      UserModel user = await dataSource.signIn(email, password);
      return Right(user);
    } catch (e) {
      return Left(AuthFailure());
    }
  }

  @override
  Future<Either<Failure, String>> isLoggedIn() async {
    try {
      String? user = dataSource.getCurrentUser();
      return Right(user ?? "NO_USER");
    } catch (e) {
      return Left(AuthFailure());
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await dataSource.logout();
      return const Right(null);
    } catch (e) {
      return Left(AuthFailure());
    }
  }
}
