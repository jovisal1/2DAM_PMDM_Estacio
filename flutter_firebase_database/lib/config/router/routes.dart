import 'package:flutter_firebase_database/domain/entities/task.dart';
import 'package:flutter_firebase_database/presentation/screens/add_edit_task_screen.dart';
import 'package:flutter_firebase_database/presentation/screens/tasks_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/tasks',
  routes: [
    GoRoute(
      path: '/tasks',
      builder: (context, state) => const TasksScreen(),
      routes: [
        GoRoute(
          path: 'add',
          builder: (context, state) => const AddEditTaskScreen(),
        ),
        GoRoute(
          path: 'edit/:id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            TaskEntity selectedTask = state.extra as TaskEntity;
            return AddEditTaskScreen(taskId: id, task: selectedTask);
          },
        ),
      ],
    ),
  ],
);
