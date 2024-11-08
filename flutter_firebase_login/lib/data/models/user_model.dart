import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String id;
  final String email;

  UserModel({required this.id, required this.email});

  static UserModel fromUserCredential(UserCredential userCredentials) {
    return UserModel(
        id: userCredentials.user?.uid ?? "NO_ID",
        email: userCredentials.user?.email ?? "NO_EMAIL");
  }
}
