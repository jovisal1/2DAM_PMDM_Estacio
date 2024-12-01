import 'package:dartz/dartz.dart';
import 'package:flutter_visitas_app/core/failure.dart';
import 'package:flutter_visitas_app/core/usecase.dart';
import 'package:flutter_visitas_app/domain/entities/visit_entity.dart';
import 'package:flutter_visitas_app/domain/repositories/visits_repository.dart';

class GetVisits implements UseCase<List<VisitEntity>, NoParams> {
  final VisitsRepository repository;

  GetVisits(this.repository);

  @override
  Future<Either<Failure, List<VisitEntity>>> call(NoParams params) {
    return repository.getVisits();
  }
}
