import 'package:bloc_cubit/model/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

part 'to_do_state.dart';

class ToDoCubit extends Cubit<ToDoState> {
  ToDoCubit() : super(ToDoInitial());

  void addTask(String title) {
    TaskModel task = TaskModel(
      title: title,
      isCompleted: false,
      id: Uuid().v4().toString(), // Generate a unique ID if not provided
    );
    final updatedTasks = List<TaskModel>.from(state.tasks)..add(task);
    emit(UpdateTask(updatedTasks));
  }

  removeTask(String id) {
    final updatedTasks = state.tasks.where((task) => task.id != id).toList();
    emit(UpdateTask(updatedTasks));
  }

  toggleTaskCompletion(String id) {
    final updatedTasks = state.tasks.map((task) {
      if (task.id == id) {
        return task.copyWith(isCompleted: !task.isCompleted!);
      }
      return task;
    }).toList();
    emit(UpdateTask(updatedTasks));
  }
}
