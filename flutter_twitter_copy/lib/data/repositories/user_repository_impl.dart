import 'package:dartz/dartz.dart';
import 'package:flutter_twitter_copy/data/datasources/user_remote_datasource.dart';
import 'package:flutter_twitter_copy/data/models/user_model.dart';
import 'package:flutter_twitter_copy/domain/entities/user.dart';
import 'package:flutter_twitter_copy/domain/repositories/user_repository.dart';
import 'package:flutter_twitter_copy/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, User>> login(String username, String password) async {
    try {
      final response = await remoteDataSource.login(username, password);
      final user = UserModel.fromJson(response);
      return Right(user);
    } catch (e) {
      return Left('Error al hacer login: $e');
    }
  }

  @override
  Future<Either<String, User>> getUserInfo(String userId) async {
    try {
      final response = await remoteDataSource.getUserInfo(userId);
      final user = UserModel.fromJson(response['user']);
      return Right(user);
    } catch (e) {
      return Left('Error obteniendo información del usuario: $e');
    }
  }

  @override
  Future<Either<String, User>> updateUser(
      String userId, String? username, String? avatar) async {
    try {
      final response =
          await remoteDataSource.updateUser(userId, username, avatar);
      final user = UserModel.fromJson(response['user']);
      return Right(user);
    } catch (e) {
      return Left('Error actualizando la información del usuario: $e');
    }
  }

  @override
  Future<Either<Exception, bool>> isLoggedIn() async {
    try {
      final prefs = sl<SharedPreferences>();
      final userId = prefs.getString('user_id');
      return Right(userId != null);
    } catch (e) {
      return Left(
          Exception("Error al verificar si el usuario está logueado: $e"));
    }
  }
}
