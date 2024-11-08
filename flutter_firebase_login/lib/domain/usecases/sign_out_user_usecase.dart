import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_login/core/failure.dart';
import 'package:flutter_firebase_login/core/use_case.dart';
import '../repositories/sign_in_repository.dart';

class SignoutUserUseCase implements UseCase<void, NoParams> {
  final SignInRepository repository;
  SignoutUserUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return repository.logout();
  }
}
