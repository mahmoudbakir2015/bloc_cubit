import 'package:bloc_cubit/controller/cubit/to_do/to_do_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoCubitPage extends StatelessWidget {
  const ToDoCubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    final toDoCubit = context.read<ToDoCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('To Do')),
      body: BlocBuilder<ToDoCubit, ToDoState>(
        builder: (context, state) {
          return Column(
            children: [
              TextField(
                controller: toDoCubit.taskController,
                decoration: InputDecoration(
                  labelText: 'Add a new task',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    toDoCubit.addTask(value);
                    toDoCubit.taskController.clear();
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
                  if (toDoCubit.taskController.text.isNotEmpty) {
                    toDoCubit.addTask(toDoCubit.taskController.text);
                    toDoCubit.taskController.clear();
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
                  itemCount: toDoCubit.state.tasks.length,
                  itemBuilder: (context, index) {
                    // Logic to display tasks
                    return ListTile(
                      leading: Checkbox(
                        value: toDoCubit.state.tasks[index].isCompleted,
                        onChanged: (value) {
                          toDoCubit.toggleTaskCompletion(
                            toDoCubit.state.tasks[index].id!,
                          );
                        },
                      ),
                      title: Text(toDoCubit.state.tasks[index].title!),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          toDoCubit.removeTask(
                            toDoCubit.state.tasks[index].id!,
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
