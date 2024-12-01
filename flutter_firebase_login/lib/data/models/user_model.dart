import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_login/domain/entities/user_entity.dart';

// El modelo UserModel
class UserModel {
  final String id;
  final String email;

  UserModel({required this.id, required this.email});

  // Crear un UserModel desde UserCredential
  static UserModel fromUserCredential(UserCredential userCredentials) {
    return UserModel(
      id: userCredentials.user?.uid ?? "NO_ID",
      email: userCredentials.user?.email ?? "NO_EMAIL",
    );
  }

  // Convertir UserModel en una instancia de User (la entidad)
  UserEntity toEntity() {
    return UserEntity(email: email);
  }
}
