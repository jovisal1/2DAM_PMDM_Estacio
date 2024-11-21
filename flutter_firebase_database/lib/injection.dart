import 'package:flutter_firebase_database/data/datasources/task_remote_datasource.dart';
import 'package:flutter_firebase_database/domain/usecases/add_task_use_case.dart';
import 'package:flutter_firebase_database/domain/usecases/delete_task_use_case.dart';
import 'package:flutter_firebase_database/domain/usecases/get_task_by_id.dart';
import 'package:flutter_firebase_database/domain/usecases/get_task_use_case.dart';
import 'package:flutter_firebase_database/domain/usecases/stream_task_use_case%20copy.dart';
import 'package:flutter_firebase_database/domain/usecases/update_task_use_case.dart';
import 'package:flutter_firebase_database/presentation/blocs/tasks/tasks_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_database/firebase_database.dart';
import 'data/repositories/task_repository_impl.dart';
import 'domain/repositories/task_repository.dart';

final getIt = GetIt.instance;

void injectDependencies() {
  // Firebase Realtime Database
  getIt
      .registerLazySingleton<FirebaseDatabase>(() => FirebaseDatabase.instance);

  // Data Sources
  getIt.registerLazySingleton<TaskRemoteDataSource>(
      () => TaskRemoteDataSourceImpl(getIt<FirebaseDatabase>()));

  // Repositories
  getIt.registerLazySingleton<TaskRepository>(
      () => TaskRepositoryImpl(getIt<TaskRemoteDataSource>()));

  // Use Cases
  getIt.registerLazySingleton(() => GetTasks(getIt<TaskRepository>()));
  getIt.registerLazySingleton(() => AddTask(getIt<TaskRepository>()));
  getIt.registerLazySingleton(() => UpdateTask(getIt<TaskRepository>()));
  getIt.registerLazySingleton(() => DeleteTask(getIt<TaskRepository>()));
  getIt.registerLazySingleton(() => GetTaskById(getIt<TaskRepository>()));
  getIt.registerLazySingleton(() => StreamTasks(getIt<TaskRepository>()));

  // Bloc
  getIt.registerFactory(() => TasksBloc(
        getTasks: getIt<GetTasks>(),
        addTask: getIt<AddTask>(),
        updateTask: getIt<UpdateTask>(),
        deleteTask: getIt<DeleteTask>(),
        getTaskById: getIt<GetTaskById>(),
        streamTasks: getIt<StreamTasks>(),
      ));
}
