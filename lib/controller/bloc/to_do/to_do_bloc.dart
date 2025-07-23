import 'dart:developer';
import 'package:bloc_cubit/controller/bloc/to_do/to_do_event.dart';
import 'package:bloc_cubit/controller/bloc/to_do/to_do_state_bloc.dart';
import 'package:bloc_cubit/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:uuid/uuid.dart';

class ToDoBloc extends HydratedBloc<ToDoEvent, ToDoStateBloc> {
  ToDoBloc() : super(ToDoInitial()) {
    on<AddTaskEvent>((event, emit) {
      TaskModel task = TaskModel(
        title: event.title,
        isCompleted: false,
        id: Uuid().v4().toString(), // Generate a unique ID if not provided
      );
      final updatedTasks = List<TaskModel>.from(state.tasks)..add(task);
      log('Adding task: $updatedTasks');
      emit(UpdateTask(updatedTasks));
      log('final task: $updatedTasks');
    });

    on<RemoveTaskEvent>((event, emit) {
      final updatedTasks = state.tasks
          .where((task) => task.id != event.id)
          .toList();
      log('Removing task with id: ${event.id}, updated tasks: $updatedTasks');
      emit(UpdateTask(updatedTasks));
      log('final task after removal: $updatedTasks');
    });

    on<ToggleTaskCompletionEvent>((event, emit) {
      final updatedTasks = state.tasks.map((task) {
        if (task.id == event.id) {
          return task.copyWith(isCompleted: !task.isCompleted!);
        }
        return task;
      }).toList();
      log(
        'Toggling task completion for id: ${event.id}, updated tasks: $updatedTasks',
      );
      // Emit the updated state with the modified tasks
      emit(UpdateTask(updatedTasks));
      log('final task after toggling completion: $updatedTasks');
    });
  }
  TextEditingController taskController = TextEditingController();

  @override
  ToDoStateBloc? fromJson(Map<String, dynamic> json) {
    return UpdateTask(
      (json['tasks'] as List).map((task) => TaskModel.fromJson(task)).toList(),
    );
  }

  @override
  Map<String, dynamic>? toJson(ToDoStateBloc state) {
    return {'tasks': state.tasks.map((task) => task.toJson()).toList()};
  }
}
