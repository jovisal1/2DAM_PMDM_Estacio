import 'package:dartz/dartz.dart';
import 'package:flutter_visitas_app/core/failure.dart';
import 'package:flutter_visitas_app/domain/entities/visit_entity.dart';

abstract class VisitsRepository {
  Future<Either<Failure, List<VisitEntity>>> getVisits();
}
