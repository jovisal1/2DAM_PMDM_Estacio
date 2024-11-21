import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_database/core/failure.dart';
import 'package:flutter_firebase_database/data/datasources/task_remote_datasource.dart';
import 'package:flutter_firebase_database/data/models/task_model.dart';
import 'package:flutter_firebase_database/domain/entities/task.dart';
import 'package:flutter_firebase_database/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource remoteDataSource;

  TaskRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<TaskEntity>>> getTasks() async {
    try {
      final taskModels = await remoteDataSource.getTasks();
      final taskEntities = taskModels.map((taskModel) {
        return taskModel.toEntity();
      }).toList();
      return Right(taskEntities);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Stream<List<TaskEntity>>> streamTasks() {
    try {
      Stream<List<TaskModel>> taskModels = remoteDataSource.streamTasks();
      Stream<List<TaskEntity>> taskEntities = taskModels.map((taskModelList) {
        return taskModelList.map((taskModel) => taskModel.toEntity()).toList();
      });
      return Right(taskEntities);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, TaskEntity>> getTaskById(String taskId) async {
    try {
      final task = await remoteDataSource.getTaskById(taskId);
      if (task != null) return Right(task.toEntity());
      return Left(ServerFailure());
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addTask(TaskEntity task) async {
    try {
      await remoteDataSource.addTask(TaskModel.fromEntity(task));
      return const Right(null);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateTask(TaskEntity task) async {
    try {
      await remoteDataSource.updateTask(TaskModel.fromEntity(task));
      return const Right(null);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteTask(String taskId) async {
    try {
      await remoteDataSource.deleteTask(taskId);
      return const Right(null);
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}
