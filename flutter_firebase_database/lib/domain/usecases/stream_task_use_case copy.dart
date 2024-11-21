import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_database/core/failure.dart';
import 'package:flutter_firebase_database/core/usecase.dart';
import 'package:flutter_firebase_database/domain/entities/task.dart';
import 'package:flutter_firebase_database/domain/repositories/task_repository.dart';

class StreamTasks {
  final TaskRepository repository;

  StreamTasks(this.repository);

  Either<Failure, Stream<List<TaskEntity>>> call(NoParams params) {
    return repository.streamTasks();
  }
}
