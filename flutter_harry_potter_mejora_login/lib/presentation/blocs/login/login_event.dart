import 'package:equatable/equatable.dart';

// Eventos
abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressed(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class LogoutButtonPressed extends LoginEvent {}
