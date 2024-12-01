import 'package:dartz/dartz.dart';
import 'package:flutter_visitas_app/core/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
