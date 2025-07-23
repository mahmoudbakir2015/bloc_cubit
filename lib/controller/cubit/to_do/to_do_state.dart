part of 'to_do_cubit.dart';

sealed class ToDoState {
  final List<TaskModel> tasks;
  const ToDoState(this.tasks);
}

final class ToDoInitial extends ToDoState {
  ToDoInitial() : super([]);
}

final class UpdateTask extends ToDoState {
  UpdateTask(super.tasks);
}
