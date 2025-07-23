import 'dart:developer';

import 'package:bloc_cubit/model/task_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

part 'to_do_state.dart';

class ToDoCubit extends Cubit<ToDoState> {
  ToDoCubit() : super(ToDoInitial());
  TextEditingController taskController = TextEditingController();

  void addTask(String title) {
    TaskModel task = TaskModel(
      title: title,
      isCompleted: false,
      id: Uuid().v4().toString(), // Generate a unique ID if not provided
    );
    final updatedTasks = List<TaskModel>.from(state.tasks)..add(task);
    log('Adding task: $updatedTasks');
    emit(UpdateTask(updatedTasks));
    log('final task: $updatedTasks');
  }

  removeTask(String id) {
    final updatedTasks = state.tasks.where((task) => task.id != id).toList();
    log('Removing task with id: $id, updated tasks: $updatedTasks');
    emit(UpdateTask(updatedTasks));
    log('final task after removal: $updatedTasks');
  }

  toggleTaskCompletion(String id) {
    final updatedTasks = state.tasks.map((task) {
      if (task.id == id) {
        return task.copyWith(isCompleted: !task.isCompleted!);
      }
      return task;
    }).toList();
    log('Toggling task completion for id: $id, updated tasks: $updatedTasks');
    // Emit the updated state with the modified tasks
    emit(UpdateTask(updatedTasks));
    log('final task after toggling completion: $updatedTasks');
  }
}
