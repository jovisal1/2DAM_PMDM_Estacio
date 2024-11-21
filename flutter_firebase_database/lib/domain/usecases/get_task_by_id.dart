import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_database/core/failure.dart';
import 'package:flutter_firebase_database/core/usecase.dart';
import 'package:flutter_firebase_database/domain/entities/task.dart';
import '../repositories/task_repository.dart';

class GetTaskById implements UseCase<TaskEntity, String> {
  final TaskRepository repository;

  GetTaskById(this.repository);

  @override
  Future<Either<Failure, TaskEntity>> call(String taskId) {
    return repository.getTaskById(taskId);
  }
}
