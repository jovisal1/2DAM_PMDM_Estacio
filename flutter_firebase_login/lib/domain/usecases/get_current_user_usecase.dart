import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_login/core/failure.dart';
import 'package:flutter_firebase_login/core/use_case.dart';
import '../repositories/sign_in_repository.dart';

class GetCurrentUserUseCase
    implements UseCase<Either<Failure, String?>, NoParams> {
  final SignInRepository repository;
  GetCurrentUserUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return repository.isLoggedIn();
  }
}
