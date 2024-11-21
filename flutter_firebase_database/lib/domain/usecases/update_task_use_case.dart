import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_database/core/failure.dart';
import 'package:flutter_firebase_database/core/usecase.dart';
import 'package:flutter_firebase_database/domain/entities/task.dart';
import '../repositories/task_repository.dart';

class UpdateTask implements UseCase<void, TaskEntity> {
  final TaskRepository repository;

  UpdateTask(this.repository);

  @override
  Future<Either<Failure, void>> call(TaskEntity task) {
    return repository.updateTask(task);
  }
}
