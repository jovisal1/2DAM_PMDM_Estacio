import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_firebase_database/data/models/task_model.dart';

abstract class TaskRemoteDataSource {
  Future<List<TaskModel>> getTasks();
  Stream<List<TaskModel>> streamTasks();
  Future<TaskModel?> getTaskById(String taskId);
  Future<void> addTask(TaskModel task);
  Future<void> updateTask(TaskModel task);
  Future<void> deleteTask(String taskId);
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final FirebaseDatabase database;

  TaskRemoteDataSourceImpl(this.database);

  @override
  Future<List<TaskModel>> getTasks() async {
    List<TaskModel> tasksList = [];
    final snapshot = await database.ref('tasks').get();
    if (snapshot.value != null) {
      final tasksMap = Map<String, dynamic>.from(snapshot.value as Map);
      return tasksMap.entries
          .map((e) =>
              TaskModel.fromJson(Map<String, dynamic>.from(e.value), e.key))
          .toList();
    }
    return tasksList;
  }

  @override
  Stream<List<TaskModel>> streamTasks() {
    List<TaskModel> tasksList = [];
    return database.ref('tasks').onValue.map((event) {
      if (event.snapshot.value != null) {
        final tasksMap = Map<String, dynamic>.from(event.snapshot.value as Map);
        return tasksMap.entries
            .map((e) =>
                TaskModel.fromJson(Map<String, dynamic>.from(e.value), e.key))
            .toList();
      }
      return tasksList;
    });
  }

  @override
  Future<TaskModel?> getTaskById(String taskId) async {
    final snapshot = await database.ref('tasks/$taskId').get();
    if (snapshot.exists) {
      return TaskModel.fromJson(
          Map<String, dynamic>.from(snapshot.value as Map), taskId);
    }
    return null;
  }

  @override
  Future<void> addTask(TaskModel task) async {
    await database.ref('tasks').push().set(task.toJson());
  }

  @override
  Future<void> updateTask(TaskModel task) async {
    await database.ref('tasks/${task.id}').update(task.toJson());
  }

  @override
  Future<void> deleteTask(String taskId) async {
    await database.ref('tasks/$taskId').remove();
  }
}
