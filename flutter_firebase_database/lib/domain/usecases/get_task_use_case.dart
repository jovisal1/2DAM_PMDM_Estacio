import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_database/core/failure.dart';
import 'package:flutter_firebase_database/core/usecase.dart';
import 'package:flutter_firebase_database/domain/entities/task.dart';
import 'package:flutter_firebase_database/domain/repositories/task_repository.dart';

class GetTasks implements UseCase<List<TaskEntity>, NoParams> {
  final TaskRepository repository;

  GetTasks(this.repository);

  @override
  Future<Either<Failure, List<TaskEntity>>> call(NoParams params) {
    return repository.getTasks();
  }
}
