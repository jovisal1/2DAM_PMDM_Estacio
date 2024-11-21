import 'package:flutter_firebase_database/domain/entities/task.dart';

abstract class TaskEvent {}

/// Evento para cargar todas las tareas desde la base de datos.
class LoadTasksEvent extends TaskEvent {}

class StreamTasksEvent extends TaskEvent {}

/// Evento para agregar una nueva tarea.
class AddTaskEvent extends TaskEvent {
  final TaskEntity task;

  AddTaskEvent(this.task);
}

/// Evento para actualizar una tarea existente.
class UpdateTaskEvent extends TaskEvent {
  final TaskEntity task;

  UpdateTaskEvent(this.task);
}

/// Evento para eliminar una tarea por su ID.
class DeleteTaskEvent extends TaskEvent {
  final String taskId;

  DeleteTaskEvent(this.taskId);
}

class GetTaskByIdEvent extends TaskEvent {
  final String taskId;

  GetTaskByIdEvent(this.taskId);
}
