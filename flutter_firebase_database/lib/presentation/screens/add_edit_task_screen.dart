import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_database/presentation/blocs/tasks/tasks_bloc.dart';
import 'package:flutter_firebase_database/presentation/blocs/tasks/tasks_event.dart';
import '../../domain/entities/task.dart';

class AddEditTaskScreen extends StatefulWidget {
  final String? taskId;
  final TaskEntity? task;

  const AddEditTaskScreen({super.key, this.taskId, this.task});

  @override
  State<AddEditTaskScreen> createState() => _AddEditTaskPageState();
}

class _AddEditTaskPageState extends State<AddEditTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _titleController.text = widget.task!.title;
      _isCompleted = widget.task!.isCompleted;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.taskId == null ? 'Add Task' : 'Edit Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              CheckboxListTile(
                title: const Text('Completed'),
                value: _isCompleted,
                onChanged: (value) {
                  setState(() {
                    _isCompleted = value!;
                  });
                },
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final task = TaskEntity(
                          id: widget.taskId ?? DateTime.now().toString(),
                          title: _titleController.text,
                          isCompleted: _isCompleted,
                        );
                        if (widget.taskId == null) {
                          context.read<TasksBloc>().add(AddTaskEvent(task));
                        } else {
                          context.read<TasksBloc>().add(UpdateTaskEvent(task));
                        }
                        Navigator.of(context).pop(); // Vuelve al listado
                      }
                    },
                    child: Text(
                        widget.taskId == null ? 'Add Task' : 'Update Task'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
