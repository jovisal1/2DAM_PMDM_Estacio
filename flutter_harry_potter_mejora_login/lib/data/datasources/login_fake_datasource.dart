import 'package:flutter_harry_potter_mejora_login/data/models/user_model.dart';

abstract class LoginFakeDatasource {
  Future<UserModel> getValidUser(String email, String password);
}

class LoginFakeDatasourceImpl implements LoginFakeDatasource {
  LoginFakeDatasourceImpl();

  @override
  Future<UserModel> getValidUser(String email, String password) async {
    if (email == 'user@example.com' && password == 'password123') {
      final user = UserModel(email: email, password: password);
      return user;
    } else {
      throw Exception("Credenciales de usuario no válidas");
    }
  }
}
