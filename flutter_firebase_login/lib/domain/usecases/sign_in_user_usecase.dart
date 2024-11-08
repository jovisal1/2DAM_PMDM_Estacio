import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_login/core/failure.dart';
import 'package:flutter_firebase_login/core/use_case.dart';
import '../repositories/sign_in_repository.dart';

class SigninUserUseCase implements UseCase<void, LoginParams> {
  final SignInRepository repository;
  SigninUserUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(LoginParams params) async {
    return repository.signIn(params.email, params.password);
  }
}

class LoginParams {
  final String email;
  final String password;
  LoginParams({required this.email, required this.password});
}
