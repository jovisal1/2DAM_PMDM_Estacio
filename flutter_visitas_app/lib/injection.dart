import 'package:flutter_visitas_app/data/datasources/visits_remote_datasource.dart';
import 'package:flutter_visitas_app/data/repositories/visits_repository_impl.dart';
import 'package:flutter_visitas_app/domain/repositories/visits_repository.dart';
import 'package:flutter_visitas_app/domain/usecases/get_visits_usecase.dart';
import 'package:flutter_visitas_app/presentation/blocs/visits/visits_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_database/firebase_database.dart';

final getIt = GetIt.instance;

void injectDependencies() {
  // Firebase Realtime Database
  getIt
      .registerLazySingleton<FirebaseDatabase>(() => FirebaseDatabase.instance);

  // Data Sources
  getIt.registerLazySingleton<VisitsRemoteDataSource>(
      () => VisitsRemoteDataSourceImpl(getIt<FirebaseDatabase>()));

  // Repositories
  getIt.registerLazySingleton<VisitsRepository>(
      () => VisitsRepositoryImpl(getIt<VisitsRemoteDataSource>()));

  // Use Cases
  getIt.registerLazySingleton(() => GetVisits(getIt<VisitsRepository>()));

  // Bloc
  getIt.registerFactory(() => VisitsBloc(
        getVisits: getIt<GetVisits>(),
      ));
}
