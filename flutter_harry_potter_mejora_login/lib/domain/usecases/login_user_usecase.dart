import 'package:dartz/dartz.dart';
import 'package:flutter_harry_potter_mejora_login/domain/entities/user.dart';
import 'package:flutter_harry_potter_mejora_login/domain/repositories/login_repository.dart';

class LoginUser {
  final LoginRepository repository;

  LoginUser(this.repository);

  Future<Either<Exception, User>> call(String email, String password) async {
    return await repository.login(email, password);
  }
}
