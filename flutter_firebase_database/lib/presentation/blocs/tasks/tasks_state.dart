import 'package:equatable/equatable.dart';
import '../../../domain/entities/task.dart';

class TasksState extends Equatable {
  final List<TaskEntity> tasks;
  final bool isLoading;
  final String? errorMessage;

  const TasksState({
    this.tasks = const <TaskEntity>[],
    this.isLoading = false,
    this.errorMessage,
  });

  TasksState copyWith({
    List<TaskEntity>? tasks,
    bool? isLoading,
    String? errorMessage,
  }) {
    return TasksState(
      tasks: tasks ?? this.tasks,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [tasks, isLoading, errorMessage];
}
