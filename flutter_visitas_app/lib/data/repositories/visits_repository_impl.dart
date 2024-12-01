import 'package:dartz/dartz.dart';
import 'package:flutter_visitas_app/core/failure.dart';
import 'package:flutter_visitas_app/data/datasources/visits_remote_datasource.dart';
import 'package:flutter_visitas_app/domain/entities/visit_entity.dart';
import 'package:flutter_visitas_app/domain/repositories/visits_repository.dart';

class VisitsRepositoryImpl implements VisitsRepository {
  final VisitsRemoteDataSource remoteDataSource;

  VisitsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<VisitEntity>>> getVisits() async {
    try {
      final visitModels = await remoteDataSource.getVisits();
      final visitEntities = visitModels.map((visitModel) {
        return visitModel.toEntity();
      }).toList();
      return Right(visitEntities);
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}
