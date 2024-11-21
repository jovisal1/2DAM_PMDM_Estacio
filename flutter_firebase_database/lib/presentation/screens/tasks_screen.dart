import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_database/domain/entities/task.dart';
import 'package:flutter_firebase_database/presentation/blocs/tasks/tasks_bloc.dart';
import 'package:flutter_firebase_database/presentation/blocs/tasks/tasks_event.dart';
import 'package:flutter_firebase_database/presentation/blocs/tasks/tasks_state.dart';
import 'package:go_router/go_router.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context
                  .push('/tasks/add'); // Navegar a la pantalla de agregar tarea
            },
          ),
        ],
      ),
      body: BlocBuilder<TasksBloc, TasksState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.errorMessage != null) {
            return Center(child: Text(state.errorMessage!));
          }

          return ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (context, index) {
              final task = state.tasks[index];
              return GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(child: Text(task.title)),
                      Checkbox(
                        value: task.isCompleted,
                        onChanged: (value) {
                          final updatedTask = TaskEntity(
                            id: task.id,
                            title: task.title,
                            isCompleted: value!,
                          );
                          context
                              .read<TasksBloc>()
                              .add(UpdateTaskEvent(updatedTask));
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context
                              .read<TasksBloc>()
                              .add(DeleteTaskEvent(task.id));
                        },
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  context.push('/tasks/edit/${task.id}',
                      extra: task); // Navegar a editar tarea
                },
              );
            },
          );
        },
      ),
    );
  }
}
