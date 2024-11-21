import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_database/core/failure.dart';
import 'package:flutter_firebase_database/core/usecase.dart';
import '../repositories/task_repository.dart';

class DeleteTask implements UseCase<void, String> {
  final TaskRepository repository;

  DeleteTask(this.repository);

  @override
  Future<Either<Failure, void>> call(String taskId) {
    return repository.deleteTask(taskId);
  }
}
