import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_database/core/usecase.dart';
import 'package:flutter_firebase_database/domain/entities/task.dart';
import 'package:flutter_firebase_database/domain/usecases/add_task_use_case.dart';
import 'package:flutter_firebase_database/domain/usecases/delete_task_use_case.dart';
import 'package:flutter_firebase_database/domain/usecases/get_task_by_id.dart';
import 'package:flutter_firebase_database/domain/usecases/get_task_use_case.dart';
import 'package:flutter_firebase_database/domain/usecases/stream_task_use_case%20copy.dart';
import 'package:flutter_firebase_database/domain/usecases/update_task_use_case.dart';
import 'package:flutter_firebase_database/presentation/blocs/tasks/tasks_event.dart';
import 'package:flutter_firebase_database/presentation/blocs/tasks/tasks_state.dart';

class TasksBloc extends Bloc<TaskEvent, TasksState> {
  final GetTasks getTasks;
  final AddTask addTask;
  final UpdateTask updateTask;
  final DeleteTask deleteTask;
  final GetTaskById getTaskById;
  final StreamTasks streamTasks;

  TasksBloc(
      {required this.getTasks,
      required this.addTask,
      required this.updateTask,
      required this.deleteTask,
      required this.getTaskById,
      required this.streamTasks})
      : super(const TasksState()) {
    on<LoadTasksEvent>(_onLoadTasks);
    on<StreamTasksEvent>(_onStreamTasks);
    on<AddTaskEvent>(_onAddTask);
    on<UpdateTaskEvent>(_onUpdateTask);
    on<DeleteTaskEvent>(_onDeleteTask);
    on<GetTaskByIdEvent>(_onGetTaskById);
  }

  Future<void> _onLoadTasks(
      LoadTasksEvent event, Emitter<TasksState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await getTasks(NoParams());
    result.fold(
      (failure) => emit(state.copyWith(
          isLoading: false, errorMessage: "Error cargando tareas")),
      (tasks) => emit(state.copyWith(isLoading: false, tasks: tasks)),
    );
  }

  Future<void> _onStreamTasks(
      StreamTasksEvent event, Emitter<TasksState> emit) async {
    await streamTasks(NoParams()).fold(
      (failure) async => state.copyWith(
        errorMessage: failure.toString(),
        isLoading: false,
      ),
      (stream) async {
        await emit.forEach<List<TaskEntity>>(
          stream,
          onData: (tasks) => state.copyWith(tasks: tasks, isLoading: false),
          onError: (error, stackTrace) => state.copyWith(
            errorMessage: error.toString(),
            isLoading: false,
          ),
        );
      },
    );
  }

  Future<void> _onAddTask(AddTaskEvent event, Emitter<TasksState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    await addTask(event.task);
    add(LoadTasksEvent());
  }

  Future<void> _onUpdateTask(
      UpdateTaskEvent event, Emitter<TasksState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    await updateTask(event.task);
    add(LoadTasksEvent());
  }

  Future<void> _onDeleteTask(
      DeleteTaskEvent event, Emitter<TasksState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    await deleteTask(event.taskId);
    add(LoadTasksEvent());
  }

  Future<void> _onGetTaskById(
      GetTaskByIdEvent event, Emitter<TasksState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await getTaskById(event.taskId);
    result.fold(
      (failure) => emit(state.copyWith(
          isLoading: false, errorMessage: "Error cargando tareas")),
      (task) => emit(state.copyWith(isLoading: false, tasks: [task])),
    );
  }
}
