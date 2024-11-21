import 'package:flutter_firebase_database/domain/entities/task.dart';

class TaskModel {
  final String id;
  final String title;
  final bool isCompleted;

  TaskModel({required this.id, required this.title, required this.isCompleted});

  factory TaskModel.fromJson(Map<String, dynamic> json, String id) {
    return TaskModel(
      id: id,
      title: json['title'],
      isCompleted: json['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isCompleted': isCompleted,
    };
  }

  TaskEntity toEntity() {
    return TaskEntity(
      id: id,
      title: title,
      isCompleted: isCompleted,
    );
  }

  static TaskModel fromEntity(TaskEntity task) {
    return TaskModel(
        id: task.id, title: task.title, isCompleted: task.isCompleted);
  }
}
