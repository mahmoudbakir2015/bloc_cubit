import 'package:bloc_cubit/controller/bloc/to_do/to_do_bloc.dart';
import 'package:bloc_cubit/controller/bloc/to_do/to_do_event.dart';
import 'package:bloc_cubit/controller/bloc/to_do/to_do_state_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoBlocPage extends StatelessWidget {
  const ToDoBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    final toDoBloc = context.read<ToDoBloc>();
    return Scaffold(
      appBar: AppBar(title: const Text('To Do')),
      body: BlocBuilder<ToDoBloc, ToDoStateBloc>(
        builder: (context, state) {
          return Column(
            children: [
              TextField(
                controller: toDoBloc.taskController,
                decoration: InputDecoration(
                  labelText: 'Add a new task',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    toDoBloc.add(AddTaskEvent(value));
                    toDoBloc.taskController.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Task title cannot be empty'),
                      ),
                    );
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (toDoBloc.taskController.text.isNotEmpty) {
                    toDoBloc.add(AddTaskEvent(toDoBloc.taskController.text));
                    // Clear the text field after adding the task
                    toDoBloc.taskController.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Task title cannot be empty'),
                      ),
                    );
                  }
                },
                child: const Text('Add Task'),
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: toDoBloc.state.tasks.length,
                  itemBuilder: (context, index) {
                    // Logic to display tasks
                    return ListTile(
                      leading: Checkbox(
                        value: toDoBloc.state.tasks[index].isCompleted,
                        onChanged: (value) {
                          toDoBloc.add(
                            ToggleTaskCompletionEvent(
                              toDoBloc.state.tasks[index].id!,
                            ),
                          );
                        },
                      ),
                      title: Text(toDoBloc.state.tasks[index].title!),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          toDoBloc.add(
                            RemoveTaskEvent(toDoBloc.state.tasks[index].id!),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Task removed successfully'),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
